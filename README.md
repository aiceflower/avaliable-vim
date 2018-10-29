# avaliable-vim
简单有用的便携式vim插件配置

### 效果图   
![image](https://github.com/aiceflower/avaliable-vim/master/image.png)

### 一、安装

1. git clone https://github.com/aiceflower/avaliable-vim.git

2. 复制 avaliable-vim/目录下所有文件到用户家目录    
    cp -a * ~

3. 在 .bash_profile文件中添加如下内容
```
  if [ -f ~/.bashrc.before ]; then
    . ~/.bashrc.before                                                                                                                  
  fi
```
4. 重新加载配置文件   
    . .bash_profile


#### 注：
如果提示没有ctags则需要安装：     
  sudo apt-get install ctags (ubuntu)    
  yum install ctags (RedHat系列)
