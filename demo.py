import os
#当前目录
base_dir = os.getcwd()
print (base_dir)
#上级目录
print(os.path.dirname(os.getcwd()))
print(os.path.abspath(os.path.dirname(os.getcwd())))
#目录拼接
print(os.path.join(base_dir,'reports','1.txt'))