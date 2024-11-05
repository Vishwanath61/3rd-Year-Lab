import pandas as pd
import matplotlib.pyplot as plt
from sklearn.metrics import accuracy_score,confusion_matrix,classification_report,ConfusionMatrixDisplay
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier,plot_tree
data=pd.read_csv('Iris.csv')  
x=data[['Sepal.Length', 'Sepal.Width',  'Petal.Length', 'Petal.Width']].values
y=data['Species'].factorize()[0]
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3, random_state=0)
model=DecisionTreeClassifier(max_depth=3,random_state=0)
model.fit(x_train,y_train)
y_pred=model.predict(x_test)
accuracy_score(y_test,y_pred)
classification_report(y_test,y_pred)
plot_tree(model,
          feature_names=['Sepal.Length',  'Sepal.Width',  'Petal.Length', 'Petal.Width'],
          class_names=data['Species'].unique(),
          filled=True)
plt.show()
