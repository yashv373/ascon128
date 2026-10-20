# usage: gen_case.py ADLEN PTLEN  -> writes ad.hex pt.hex exp.hex (NIST-style inputs: AD=30.., PT=20.. (ascon-c KAT convention); key 00..0f, nonce 10..1f)
import sys; sys.path.insert(0,'.')
import golden_fixed as g
a,p=int(sys.argv[1]),int(sys.argv[2])
key=bytes(range(16)); nonce=bytes(range(16,32)); ad=bytes((0x30+i)&255 for i in range(a)); pt=bytes((0x20+i)&255 for i in range(p))
ct,tag=g.ascon_encrypt(key,nonce,ad,pt)
for n,d in (('ad',ad),('pt',pt),('exp',ct+tag)): open(n+'.hex','w').write(''.join('%02x\n'%x for x in d) or '00\n')
# NIST KAT cross-check when in KAT range
import re
if a<=32 and p<=32:
    t=open('kat/LWC_AEAD_KAT_128_128.txt').read().split('\n\n')
    for blk in t:
        if 'Count' not in blk: continue
        d=dict(l.split(' = ') if ' = ' in l else (l.split(' =')[0],'') for l in blk.strip().split('\n') if l)
        if d.get('PT','')==pt.hex().upper() and d.get('AD','')==ad.hex().upper():
            print('NIST_KAT Count=%s match=%s'%(d['Count'],d['CT']==(ct+tag).hex().upper()))
