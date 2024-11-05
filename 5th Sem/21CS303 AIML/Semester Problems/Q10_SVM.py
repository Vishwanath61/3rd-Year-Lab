import numpy as np
import matplotlib.pyplot as plt
from sklearn import svm
from sklearn.metrics import accuracy_score,confusion_matrix
x=np.array([[3,1],[3,-1],[6,1],[6,-1],[1,0],[0,1],[0,-1],[-1,0]])
y=np.array([-1,-1,-1,-1,1,1,1,1])
print(x)
print(y)
model=svm.SVC(kernel='linear')
model.fit(x,y)
y_pred=model.predict(x)
print(y_pred)
plt.figure(figsize=(8,6))
plt.scatter(x[:,0],x[:,1],c=y)
x_lim=plt.xlim()
y_lim=plt.ylim()
xx,yy=np.meshgrid(np.linspace(xlim[0],xlim[1],50),
      np.meshgrid(np.linspace(ylim[0],ylim[1],50))
)
z= model.decision_function(np.c_[xx.ravel(),yy.ravel()]).reshape(xx.shape)
plt.contour(xx,yy,z,levels=[-1,0,1],colors='k',linestyles=['--','-','--'])
plt.scatter(model.support_vectors_[:,0],model.support_vectors_[:,1],label="Support Vectors")
plt.legend()
plt.grid(True)
plt.show()
accuracy_score(y,y_pred)
confusion_matrix(y,y_pred)
