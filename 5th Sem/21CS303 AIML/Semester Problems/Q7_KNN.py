import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
from sklearn.metrics import accuracy_score,classification_report
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
data=pd.read_csv('Iris.csv')
x=data[['Sepal.Length','Sepal.Width','Petal.Length','Petal.Width']]
y=data['Species']
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.4,random_state=42)
scaler=StandardScaler()
x_train=scaler.fit_transform(x_train)
x_test=scaler.transform(x_test)
model=KNeighborsClassifier(n_neighbors=5)
model.fit(x_train,y_train)
y_pred=model.predict(x_test)
print('Accuracy:', accuracy_score(y_test,y_pred)*100 )
print(classification_report(y_test,y_pred))
sb.scatterplot(data=data)
plt.show()
