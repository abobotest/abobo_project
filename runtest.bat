@echo off
rem encodig=GB2312
echo **********************************************************************
echo *************************【自动化案例构建开始】***********************
set pypath="%cd%\venv\Scripts\python.exe"

echo %pypath%
if exist %pypath% (
    echo *************************【使用项目环境下Python解释器执行】***********
    %pypath% %cd%\main\run.py
) else (
    echo *************************【使用系统环境变量下Python解释器执行】*******
    python runtest.py
)
echo *************************【自动化案例构建结束】***********************
