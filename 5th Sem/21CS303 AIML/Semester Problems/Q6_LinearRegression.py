import numpy as np
import matplotlib.pyplot as plt
x=np.array([0,1,2,3,4,5,6,7,8,9])
y=np.array([1,3,2,5,7,8,8,9,10,12])
m=np.cov(x,y,bias=True)[0,1]/np.var(x)
c=np.mean(y)-m*np.mean(x)
plt.scatter(x,y,color='magenta',label='Data Points')
plt.plot(x,m*x+c,color='green',label='Regression Line')
plt.legend()
plt.title('Linear Regression')
plt.show()
