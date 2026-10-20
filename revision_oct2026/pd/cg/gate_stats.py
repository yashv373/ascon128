# usage: python gate_stats.py NETLIST.v  -> flops, ICGs, flops on gated clocks (CLK/CLKN net driven by an ICG Q), TE ties, ICG fanout histogram
import re, sys, collections
t = open(sys.argv[1]).read()
cells = []
for typ, name, body in re.findall(r'^\s*(gf180mcu_fd_sc_mcu7t5v0__\w+)\s+(\S+)\s*\((.*?)\);', t, flags=re.S | re.M):
    cells.append((typ, name, {p: n.strip() for p, n in re.findall(r'\.(\w+)\(\s*(.*?)\s*\)', body, flags=re.S)}))
ff = [c for c in cells if '__dff' in c[0] or '__sdff' in c[0] or '__lat' in c[0]]
icg = [c for c in cells if '__icg' in c[0]]
gq = {c[2]['Q']: c for c in icg}
gated = [c for c in ff if c[2].get('CLK', c[2].get('CLKN')) in gq]
fan = collections.Counter(c[2].get('CLK', c[2].get('CLKN')) for c in gated)
print('flops', len(ff), '| ICGs', len(icg), collections.Counter(c[0].split('__')[1] for c in icg))
print('flops on gated clock', len(gated), 'fraction %.4f' % (len(gated) / len(ff)))
print('ICG TE pins:', collections.Counter(c[2]['TE'] for c in icg))
print('ICG fanout (flops/ICG) min %d max %d' % (min(fan.values()), max(fan.values())), sorted(fan.values()))
