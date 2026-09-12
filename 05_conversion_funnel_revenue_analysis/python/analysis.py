from pathlib import Path
import pandas as pd
ROOT=Path(__file__).resolve().parents[1]
df=pd.read_csv(ROOT/'data/conversion_funnel_events.csv',parse_dates=['event_date'])
OUT=ROOT/'outputs'; OUT.mkdir(exist_ok=True)
order=['view','add_to_cart','checkout','purchase']
funnel=df.groupby('event').user_id.nunique().reindex(order)
print('Funnel users:'); print(funnel)
print(f"Overall conversion: {funnel['purchase']/funnel['view']:.2%}")
p=df[df.event=='purchase']
print(f"Revenue: ${p.revenue.sum():,.2f}")
print(f"AOV: ${p.revenue.mean():,.2f}")
for col in ['device','medium','country']:
    out=df.groupby(['user_id',col]).agg(viewed=('event',lambda x:(x=='view').any()),purchased=('event',lambda x:(x=='purchase').any()),revenue=('revenue','sum')).reset_index()
    seg=out.groupby(col).agg(viewers=('viewed','sum'),purchasers=('purchased','sum'),revenue=('revenue','sum')).reset_index()
    seg['conversion_rate']=seg.purchasers/seg.viewers
    seg.to_csv(OUT/f'{col}_performance_python.csv',index=False)
