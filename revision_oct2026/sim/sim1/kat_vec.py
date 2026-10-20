# write ad/pt/exp.hex for KAT Count=N straight from the official ascon-c KAT file (key 00..0f, nonce 10..1f)
import sys
n=sys.argv[1]
for blk in open('kat/LWC_AEAD_KAT_128_128.txt').read().replace('\r','').split('\n\n'):
    d=dict((l.split(' = ')+[''])[:2] if ' = ' in l else (l.split(' =')[0],'') for l in blk.strip().split('\n') if l)
    if d.get('Count')==n:
        for k,f in (('AD','ad'),('PT','pt'),('CT','exp')):
            b=bytes.fromhex(d[k]); open(f+'.hex','w').write(''.join('%02x\n'%x for x in b) or '00\n')
        print(len(bytes.fromhex(d['AD'])),len(bytes.fromhex(d['PT'])))
