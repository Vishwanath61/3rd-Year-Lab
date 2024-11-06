import matplotlib.pyplot as plt
import os
from sklearn.cluster import KMeans
from sklearn.datasets import load_sample_image
image=load_sample_image('china.jpg')/255.0
w,h,d=image.shape
image_array=image.reshape(-1,d)
model=KMeans(n_clusters=2,random_state=0)
model.fit(image_array)
compressed_image=model.cluster_centers_[model.labels_].reshape(w,h,d)
plt.figure(figsize=(10,5))
plt.subplot(1,2,1)
plt.imshow(image)
plt.subplot(1,2,2)
plt.imshow(compressed_image)
plt.show()


#Optional
plt.imsave('original.jpg',image)
plt.imsave('compressed.jpg',compressed_image)
ogsize=os.path.getsize('original.jpg')/1024
compsize=os.path.getsize('compressed.jpg')/1024
print(f'Original size: {ogsize:.2f} KB')
print(f'Compressed size: {compsize:.2f} KB')
