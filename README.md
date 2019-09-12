# robotframework自动化测试框架
基于seleniumlibrary实现web自动化测试，表格式语法让自动化测试编写更加便利与可维护。

### 项目目录
    1. Config: 配置文件
    2. Data: 测试数据
    3. innisfree_etude_project: rfs工程目录，可用RFS的IDE打开此目录,包含测试用例
    5. main: 主入口文件
    6. reports: 测试报告以及测试LOG存放的目录
    7. util: 工具类
    8、driver: 浏览器驱动
    9. venv: python虚拟环境，
    10. runtest.bat: 启动并执行案例(执行runtest.py)
    11. 启动robotframework_IDE.bat: RFS的IDE，用于编写测试用例
    12. requirements.txt: 依赖第三方库明细


### 运行

    1、启用robotframework IDE编辑测试用例,点击工程目录下的启动robotframework_IDE.bat
    右健Run cmd Script,可打开IDE，IDE里打开的工程为本项目的test目录，里面包含测试套件
    测试用例等。

    2、运行测试用例，可在IDE里选择以及执行测试用例，界面上操作会比较直观，也可执行项目目录下的runtest.bat脚本
    执行(建议此方式执行)，运行参数在data目录下可自行调整（RFS的使用可参考其官方文档）。
    
    3、本目录生成的测试报告在reports下，执行runtest.bat脚本可结合jenkins进行持续集成，jenkins安装Robot Framework plugin插件。
    
    4、浏览器驱动目录需存放在系统环境变量下， 本人使用的驱动为(Session info: chrome=76.0.3809.132)
    (Driver info: chromedriver=2.38.552522