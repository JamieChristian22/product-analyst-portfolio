from pathlib import Path
import pandas as pd
ROOT=Path(__file__).resolve().parents[1]
df=pd.read_csv(ROOT/'Data/salesforce_opportunities.csv')
open_df=df[~df.Stage.isin(['Closed Won','Closed Lost'])]
closed=df[df.Stage.isin(['Closed Won','Closed Lost'])]
print('Open pipeline:',open_df.Amount.sum())
print('Weighted pipeline:',open_df.Weighted_Pipeline.sum())
print('Win rate:',(closed.Stage=='Closed Won').mean())
print('Stale open:',open_df.Stale_Flag.sum())
print('Overdue open:',open_df.Overdue_Flag.sum())
