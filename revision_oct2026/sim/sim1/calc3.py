# Adversary follow-ups: AXI throughput + energy/bit at core / AXI / SPI limits (all from logs)
import re
ev={}
txt=open('axi_runs.log').read()
runs=re.split(r'(?=EVT DATA_START)',txt)[1:]
res=[]
for r in runs:
    ds=int(re.search(r'DATA_START cyc=(\d+)',r)[1]); lf=int(re.search(r'LAST_FULL_START cyc=(\d+)',r)[1])
    m=re.search(r'RESULT mode=(\S+)\s*(\+MIN)?\s*adlen=(\d+) ptlen=(\d+) total_cycles=(\d+) errors=(\d+)',r)
    res.append((m[2] or 'default',int(m[3]),int(m[4]),int(m[5]),int(m[6]),ds,lf))
def cpb(flavor):
    a=[x for x in res if x[0]==flavor]; a.sort(key=lambda x:x[2])
    (f,ad,p1,t1,e1,d1,l1),(f,ad,p2,t2,e2,d2,l2)=a
    n1,n2=p1//16-1,p2//16-1       # intervals between first-data-push and last-full-push
    return (l2-d2)/n2,(l1-d1)/n1,(t2-t1)/((p2-p1)//16),a
P=15.0161e-3  # W, sta_enc.log (VCD-annotated, 16 MHz TT)
print("AXI-level (axi_ascon driven directly, polling BFM). cycles/block:")
out={}
for fl in ('default','+MIN'):
    c2,c1,cm,a=cpb(fl)
    out[fl]=cm
    print(" flavor %-8s: first->last-full push spacing %.2f (PT1024) / %.2f (PT512); marginal total %.2f cycles/block; errors %s; total cycles (AD32): %s"%(fl,c2,c1,cm,[x[4] for x in a],[(x[2],x[3]) for x in a]))
    for f in (16e6,20e6):
        thr=128*f/cm
        print("    %2d MHz: %.2f Mbit/s"%(f/1e6,thr/1e6))
    print("    energy/bit at 16 MHz, P=%.4f mW: %.3f nJ/bit"%(P*1e3,P/(128*16e6/cm)*1e9))
core=18.0; spi=672e-6
print("core-limited : %.1f Mbit/s, %.4f nJ/bit"%(128*16e6/core/1e6,P/(128*16e6/core)*1e9))
print("SPI-limited steady state: %.1f kbit/s, %.2f nJ/bit ; measured short-message window (incl. setup): 152.9 nJ/PT-bit"%(128/spi/1e3,P/(128/spi)*1e9))
print("core busy fraction in SPI enc window (16,64): %d active cycles / %d window cycles = %.3f %%"%(161,5214e-6*16e6,161/(5214e-6*16e6)*100))
