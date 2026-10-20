import json,sys,os,glob
r=sys.argv[1]; f=os.path.join(r,'final','metrics.json')
if not os.path.exists(f):
    print("NO final/metrics.json; last steps:", sorted(os.listdir(r))[-3:] if os.path.isdir(r) else r)
    fl=os.path.join(r,'flow.log')
    if os.path.exists(fl): print(''.join(open(fl,errors='replace').readlines()[-15:]))
    sys.exit()
m=json.load(open(f))
keys=['timing__setup__ws','timing__setup__tns','timing__hold__ws','timing__hold__tns','timing__setup_vio__count','timing__hold_vio__count','design__max_slew_violation__count','design__max_cap_violation__count','design__max_fanout_violation__count','route__drc_errors','magic__drc_error__count','klayout__drc_error__count','design__lvs_error__count','design__lvs_net_difference__count','antenna__violating__nets','route__antenna_violation__count','design__instance__count','design__instance__count__stdcell','design__instance__utilization','design__instance__utilization__stdcell','power__total']
for k,v in sorted(m.items()):
    if k in keys or any(k.startswith(x+'__corner:') for x in keys): print(k,v)
