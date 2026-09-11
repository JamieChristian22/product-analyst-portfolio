from pathlib import Path
import pandas as pd
ROOT=Path(__file__).resolve().parents[1]
users=pd.read_csv(ROOT/'data/kpi_users.csv')
spend=pd.read_csv(ROOT/'data/marketing_spend_daily.csv')
OUT=ROOT/'outputs'; OUT.mkdir(exist_ok=True)
ch=users.groupby('acquisition_channel').agg(users=('user_id','nunique'),paid_users=('is_paid','sum'),conversion_rate=('is_paid','mean'),revenue_usd=('revenue_usd','sum')).reset_index()
ret=users[users.is_paid==1].groupby('acquisition_channel').retained_30d.mean().rename('retention_30d').reset_index()
sp=spend.groupby('acquisition_channel').spend_usd.sum().rename('spend_usd').reset_index()
ch=ch.merge(ret,on='acquisition_channel').merge(sp,on='acquisition_channel')
ch['cac']=ch.spend_usd/ch.paid_users
ch['roi']=(ch.revenue_usd-ch.spend_usd)/ch.spend_usd
ch['arppu']=ch.revenue_usd/ch.paid_users
ch.to_csv(OUT/'channel_kpi_scorecard_python.csv',index=False)
print(ch.sort_values('roi',ascending=False).to_string(index=False))
