#import tensorflow as tf ##텐서플로우 버전 1.x
import tensorflow.compat.v1 as tf#텐서플로우 버전 2.0에서 1.x버전 문법을 사용하겠습니다.
tf.disable_v2_behavior() #2.0 비활성화
import numpy as np
import random#데이터 섞기
import sys

#요일 온도 날씨 //판매량
"""
요일 월화수목금토일 0 1 2 3 4 5 6
온도 -50~50 0.0~1.0
날씨 비/눈, 흐림, 맑음 -1,0,1


"""
f = open(sys.argv[1], "rt")
fread=f.read()
data=fread.splitlines()
data=[i.split(',') for i in data]
for i in range(len(data)):
    data[i]=[float(i) for i in data[i]]

random.shuffle(data)
data=np.array(data);
Xdata=data[:,:3];
Ydata=data[:,3:];

X=tf.placeholder(tf.float32,shape=[None, 3])
Y=tf.placeholder(tf.float32,shape=[None, 1])

W1=tf.Variable(tf.random_normal([3,100]), name='weight1')
b1=tf.Variable(tf.random_normal([100]), name='bias1')
N1=tf.nn.sigmoid(tf.matmul(X,W1)+b1)


W2=tf.Variable(tf.random_normal([100,50]), name='weight2')
b2=tf.Variable(tf.random_normal([50]), name='bias2')
N2=tf.nn.sigmoid(tf.matmul(N1,W2)+b2)

W3=tf.Variable(tf.random_normal([50,20]), name='weight3')
b3=tf.Variable(tf.random_normal([20]), name='bias3')
N3=tf.nn.sigmoid(tf.matmul(N2,W3)+b3)

W4=tf.Variable(tf.random_normal([20,1]), name='weight4')
b4=tf.Variable(tf.random_normal([1]), name='bias4')



hypothesis =tf.matmul(N3,W4)+b4
lr=1e-2
epoch=1000

cost = tf.reduce_mean(tf.square(hypothesis - Y))#MSE


#optimizer = tf.train.GradientDescentOptimizer(learning_rate=lr)#SGD
optimizer = tf.train.AdamOptimizer(learning_rate=lr)
#optimizer = tf.train.RMSPropOptimizer(learning_rate=lr)



train = optimizer.minimize(cost)





costdata=[]

sess = tf.Session()

sess.run(tf.global_variables_initializer())

for step in range(epoch):
   cost_val, hy_val, _ = sess.run([cost, hypothesis, train], feed_dict={X:Xdata, Y:Ydata})


num=int(sys.argv[2]);
cur=3

Xtest=[]
for  x in range(num):
    temp=[float(sys.argv[cur]),float(sys.argv[cur+1]),float(sys.argv[cur+2])]
    cur=cur+3
    Xtest.append(temp);
Xtest=np.array(Xtest)
hy=sess.run(hypothesis, feed_dict={X:Xtest})
for x in hy:
    print(int(round(x[0])),end=' ')
