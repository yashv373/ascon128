# Make a simulation copy of the post-PnR netlist: drop VDD/VSS/VNW/VPW pin connections (cell models have no power pins)
# and drop instances left with no connections (tap/fill/decap). Source file is read-only.
import re,sys
src=r'../../runs/ascon_final/final/pnl/spi_slave.pnl.v'
t=open(src).read()
n0=len(re.findall(r'^\s*gf180mcu_\S+\s+\S+\s*\(',t,flags=re.M))
t=re.sub(r'\s*\.(VDD|VSS|VNW|VPW)\(\s*\w+\s*\),?','',t)
# instances now empty: "cell inst ( );"  (also trailing comma leftovers)
t=re.sub(r',(\s*\))',r'\1',t)
empty=re.findall(r'^\s*(gf180mcu_\S+)\s+(\S+)\s*\(\s*\)\s*;',t,flags=re.M)
t=re.sub(r'^\s*gf180mcu_\S+\s+\S+\s*\(\s*\)\s*;\n','',t,flags=re.M)
t=t.replace('    VSS,\n    VDD);',');').replace(' inout VSS;\n inout VDD;\n','')
t=t.replace('    sclk,\n);','    sclk);')
open('spi_slave.pnl_nopwr.v','w').write(t)
from collections import Counter
print('instances',n0,'removed empty (power-only) instances',len(empty),Counter(c for c,_ in empty))
