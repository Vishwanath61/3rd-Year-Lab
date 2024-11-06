import pandas as pd
import numpy as np
data=pd.read_csv("play_tennis.csv").drop(columns=['day'])
data.head()
data
data['play'].value_counts()
p_yes=9/14
p_no=5/14
pd.crosstab(data['outlook'],data['play'])
pon=0
poy=4/9
prn=2/5
pry=3/9
psn=3/5
psy=2/9
pd.crosstab(data['temp'], data['play'])
pcoolno = 1 / 5
photno = 2 / 5
pmildno = 2 / 5
pcoolyes = 3 / 9
photyes = 2 / 9
pmildyes = 4 / 9
pd.crosstab(data['humidity'], data['play'])
phighno = 4 / 5
pnormalno = 1 / 5
phighyes = 3 / 9
pnormalyes = 6 / 9
pd.crosstab(data['wind'], data['play'])
pstrongno = 3 / 5
pweakno = 2 / 5
pstrongyes = 3 / 9
pweakyes = 6 / 9
pyes=p_yes*psy*photyes*phighyes*pweakyes
pno=p_no*p_no*photno*phighno*pweakno
print(pyes)
print(pno)
if pyes > pno:
    print("Play Tennis")
else:
    print("Do Not Play Tennis")
