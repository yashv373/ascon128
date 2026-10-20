# Validate repo golden model against the official NIST/ascon-c KAT (1089 vectors)
import sys; sys.path.insert(0,".")
import golden_fixed as g
vs=[];cur={}
for l in open('kat/LWC_AEAD_KAT_128_128.txt'):
    l=l.strip()
    if not l:
        if cur: vs.append(cur);cur={}
        continue
    k,v=l.split(' = ') if ' = ' in l else (l.split(' =')[0],'')
    cur[k]=v
if cur: vs.append(cur)
bad=0
for v in vs:
    ct,tag=g.ascon_encrypt(bytes.fromhex(v['Key']),bytes.fromhex(v['Nonce']),bytes.fromhex(v['AD']),bytes.fromhex(v['PT']))
    if (ct+tag).hex().upper()!=v['CT']: bad+=1
print("KAT vectors",len(vs),"golden-model mismatches",bad)
mm=[(len(bytes.fromhex(v['AD'])),len(bytes.fromhex(v['PT']))) for v in vs if (lambda r:(r[0]+r[1]).hex().upper()!=v['CT'])(g.ascon_encrypt(bytes.fromhex(v['Key']),bytes.fromhex(v['Nonce']),bytes.fromhex(v['AD']),bytes.fromhex(v['PT'])))]
print("mismatch (adlen,ptlen):",mm)
