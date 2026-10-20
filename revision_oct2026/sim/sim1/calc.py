# Derive tabulated numbers from logs (no hand arithmetic). Run: python calc.py > calc.out
import re,glob
f=16e6
ev={}
cur=None
for l in open('core_cycles.log'):
    m=re.match(r'RESULT adlen=(\d+) ptlen=(\d+) start_to_done_cycles=(\d+) errors=(\d+)',l)
    if m: ev[(int(m[1]),int(m[2]))]=int(m[3])
print("core start->done cycles:",ev)
# per-block spacing from the 0,4000 and 16,64 runs
txt=open('core_cycles.log').read()
runs=re.split(r'(?=^NIST_KAT|^EVT START)',txt,flags=re.M)
din=[int(x) for x in re.findall(r'DIN_CONSUME cyc=(\d+)',txt.split('adlen=0 ptlen=1024')[0].split('adlen=32 ptlen=256')[-1])]
ad=[int(x) for x in re.findall(r'AD_CONSUME cyc=(\d+)',txt.split('adlen=16 ptlen=16')[1].split('adlen=16 ptlen=64')[0])]
import collections
d=[b-a for a,b in zip(din,din[1:])]
print("din consume spacing (0,1024 run) histogram:",collections.Counter(d))
A=ev[(0,4000)]-ev[(0,1024)]; B=(4000//16)-(1024//16)
cpb=A/B
print("asymptotic cycles/block = (c(0,4000)-c(0,1024))/(250-64) =",cpb,"; cycles/byte =",cpb/16)
print("throughput @16MHz Mbit/s = 128*f/cpb =",128*f/cpb/1e6)
print("per-message throughput @16MHz (PT bits / start->done time), Mbit/s:")
for (a,p),c in sorted(ev.items()):
    if p: print("  AD=%d PT=%d: %d cycles -> %.1f Mbit/s (PT-only), latency %.2f us"%(a,p,c,8*p*f/c/1e6,c/f*1e6))
    else: print("  AD=%d PT=%d: %d cycles latency %.2f us"%(a,p,c,c/f*1e6))

# ---------------- SPI-bound system throughput (RTL SPI sweep, sclk=500 kHz) ----------------
sw={}
for l in open('spi_rtl_sweep.log'):
    m=re.search(r'adlen=(\d+) ptlen=(\d+) frames=(\d+) window_us=(\d+)',l)
    if m: sw[(int(m[1]),int(m[2]))]=(int(m[3]),int(m[4]))
(f1,t1),(f2,t2)=sw[(0,256)],sw[(0,512)]
nb=(512-256)//16
print("SPI frames/block (marginal):",(f2-f1)/nb,"; us/block:",(t2-t1)/nb,"; bits over SPI/block:",(f2-f1)/nb*40)
print("SPI-bound steady-state throughput kbit/s = 128/(us/block) =",128/((t2-t1)/nb)*1e3)
# ---------------- power / energy ----------------
def tot(fn):
    for l in open(fn):
        if l.startswith('Total') and 'e-' in l: return float(l.split()[4])
P={k:tot('sta_%s.log'%k) for k in ('vectorless','idle','enc')}
print("Total power W (report_power -digits 5):",P)
g=open('gls_nosdf_16_64.log').read()
w=re.search(r'window_us=(\d+)',g); win=int(w[1])*1e-6
PTb=64*8; ADPTb=(16+64)*8
E_=P['enc']*win
print("enc window us:",win*1e6,"; E_window uJ:",E_*1e6)
print("energy/PT-bit nJ:",E_/PTb*1e9,"; energy/(AD+PT)-bit nJ:",E_/ADPTb*1e9)
Pc=P['idle']  # core-active-only energy, ideal back-to-back: 161 cycles for (16,64)
t_core=161/16e6
print("if core ran the same message back-to-back at 16 MHz (161 cycles = %.2f us) using the activity-window power: E/PT-bit nJ = %.4f"%(t_core*1e6,P['enc']*t_core/PTb*1e9))
print("idle power W:",P['idle'],"; enc-window minus idle mW:",(P['enc']-P['idle'])*1e3)
# ---------------- area ----------------
std=456362.32; tot_ds=545536; nand=10.976
print("kGE total design area (545536/10.976):",tot_ds/nand/1e3)
print("kGE logic std cells only (456362.32):",std/nand/1e3)
y={}
cur=None
for l in open('yosys_stat_hier.rpt'):
    m=re.search(r"Chip area for module '.(\w+)': ([\d.]+)",l)
    if m: y[m[1]]=float(m[2])
    m=re.search(r"Chip area for top module '.(\w+)': ([\d.]+)",l)
    if m: y['TOP_'+m[1]]=float(m[2])
print(y)
core=y['ascon_core_adpt_encdec']+y['ascon_round_s1']+y['ascon_round_s2']
print("fresh-yosys core(+rounds) um2",core,"= kGE",core/nand/1e3,"; fraction of top",core/y['TOP_spi_slave'])
