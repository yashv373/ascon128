# Per-hierarchy area/flop count from the SIGNED-OFF (flattened) post-PnR netlist (power pins stripped copy, same cells).
# Flops: hierarchy from the Q-net name prefix (flatten keeps u_master.u_slave.u_core.* names).
# Comb cells (anonymous _NNNN_ names): assigned to the hierarchy of the majority of flop D-endpoints in their forward cone;
# cells whose cone reaches only flop CLK pins = clock tree; antenna/tap/endcap/tie separate. => comb split is APPROXIMATE.
import re, collections, sys
sys.setrecursionlimit(100000)
lib = open('tt.lib').read()
area = {m[0]: float(m[1]) for m in re.findall(r'cell\s*\(\s*"?(\w+)"?\s*\)\s*\{\s*area\s*:\s*([\d.]+)', lib)}
t = open('../../runs/ascon_final/final/pnl/spi_slave.pnl.v').read()
cells = []
for typ, name, body in re.findall(r'^\s*(gf180mcu_fd_sc_mcu7t5v0__\w+)\s+(\S+)\s*\((.*?)\);', t, flags=re.S | re.M):
    pins = {p: n.strip() for p, n in re.findall(r'\.(\w+)\(\s*(.*?)\s*\)', body, flags=re.S)}
    cells.append((typ, name, pins))
OUT = {'Z', 'ZN', 'Q', 'QN', 'CO', 'S'}
def grp(q):
    q = q.lstrip('\\')
    q = re.sub(r'(\[\d+\])+$', '', q)
    p = q.split('.')
    if p[:3] == ['u_master', 'u_slave', 'u_core']: return 'core(ascon_core_adpt_encdec)'
    if p[:2] == ['u_master', 'u_slave']: return 'axi_ascon'
    if p[:1] == ['u_master']: return 'axi_master'
    if p[:1] in (['u_rs_clk'], ['u_rs_spi']): return 'reset_sync'
    return 'spi_slave(top)'
sinks = collections.defaultdict(list)
for i, (typ, name, pins) in enumerate(cells):
    for p, n in pins.items():
        if p not in OUT: sinks[n].append((i, p))
isff = lambda typ: '__dff' in typ or '__sdff' in typ or '__lat' in typ
cat = {}
for i, (typ, name, pins) in enumerate(cells):
    if isff(typ): cat[i] = grp(pins['Q'])
memo = {}
def cone(i):
    if i in memo: return memo[i]
    memo[i] = collections.Counter()  # cycle guard
    c = collections.Counter()
    for p, n in cells[i][2].items():
        if p in OUT:
            for j, sp in sinks[n]:
                if isff(cells[j][0]):
                    c['__clk' if sp in ('CLK', 'CLKN') else cat[j]] += 1
                else:
                    c.update(cone(j))
    memo[i] = c
    return c
res = collections.defaultdict(lambda: [0, 0, 0.0, 0.0])  # nflop, ncomb, area_flop, area_comb
for i, (typ, name, pins) in enumerate(cells):
    a = area[typ]
    if 'fill' in typ or 'filltie' in typ or 'endcap' in typ:
        g = 'tap/endcap';
        if 'filltie' in typ or 'endcap' in typ: pass
        else: continue  # fill cells excluded (not in design area)
    elif '__antenna' in typ: g = 'antenna diodes'
    elif '__tie' in typ: g = 'tie'
    elif isff(typ): g = cat[i]
    else:
        c = cone(i)
        if not c: g = 'unattributed(drives ports only)'
        else:
            top = c.most_common(1)[0][0]
            g = 'clock tree' if top == '__clk' else top
    r = res[g]
    if isff(typ): r[0] += 1; r[2] += a
    else: r[1] += 1; r[3] += a
NAND = 10.976
print('%-34s %6s %6s %12s %12s %9s %8s' % ('group', 'flops', 'comb', 'flop um2', 'comb um2', 'total um2', 'kGE'))
tf = tc = ta = 0
for g, (nf, nc, af, ac) in sorted(res.items(), key=lambda x: -(x[1][2] + x[1][3])):
    print('%-34s %6d %6d %12.1f %12.1f %9.1f %8.2f' % (g, nf, nc, af, ac, af + ac, (af + ac) / NAND / 1e3))
    tf += nf; tc += nc; ta += af + ac
print('%-34s %6d %6d %12s %12s %9.1f %8.2f' % ('TOTAL (excl. fill)', tf, tc, '', '', ta, ta / NAND / 1e3))
