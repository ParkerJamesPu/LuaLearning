-->>>Lua 模块与包

--模块类似于一个封装库，从lua5.1开始，lua加入了标准的模块管理机制，可以把一些公用的代码方在一个文件里，
--以API接口的形式在其他地方调用，有利于代码的重用和降低代码的耦合度
--Lua 的模块是由变量、函数等已知元素组成的table，因此创建一个模块很简单，就是创建一个table,
--然后把需要导出的常量、函数放入其中，最后返回这个table就行。
--以下为创建自定义模块module.lua，文件代码格式如下：
--注意：模块文件不能和调用文件在同一个.lua文件中
--文件名为module.lua
-- module={};
-- --定义一个常量
-- module.constant="这是一个常量";
-- --定义一个函数
-- function module.func1()
--     io.write("这是一个共有函数func1\n")
-- end
-- local function func2()
--     print("这是一个私有函数func2")
-- end
-- function module.func3()
--     print("调用私有函数");
--     func2();
-- end
-- return module;

--1.require函数
--Lua 提供了一个名为require的函数用来加载模块。 要加载一个模块，只要需要简单的调用就可以啦
-- require("模块名称")或require "模块名称"
-- module_test= require("module");
-- print("调用模块常量：",module_test.constant)
-- module_test.func1();
-- module_test.func3();

--2.加载机制
--对于自定义的模块，模块文件不是放在那个目录都行，函数require有它自己的文件路径加载策略，它会尝试从lua文件或c程序库中加载模块。
--require用于搜索Lua文件的路径是否存放在全局变量package.path中，当Lua启动后，会以环境变量LUA_PATH的值来初始化这个环境变量。如果没有找到该环境变量，则会使用一个编译时定义的默认路径来初始化。
--当然，如果没有LUA_PATH的这环境变量，也可以自定义设置，在当前用户根目录下打开.profile文件(没有则创建，打开.bashrc文件也可以)
--例如require("module")时就会尝试打开以下文件目录去搜索目标：
--/用户文件下下/module.lua
--./module.lua   -->根目录下查找
--/usr/local/share/lua/5.4/module.lua
--/usr/local/share/lua/5.4/module/init.lua
--/usr/locl/lib/lua/5.4/module.lua
--/usr/local/lib/lua/5.4/module/init.lua
--如果找到目标文件，就会调用package.loadfile来加载模块。否则，就会去c程序库中查找。
--搜索的文件路径时从全局变量package.cpath获取，而这个变量测试通过环境变量LUA_CPATH来初始
--搜索的策略跟上面的一样，只不过是现在的搜索唤成的是so或dll类型的文件，如果找的到，那么require就会通过package.loadlib来加载它


--3.C包
--Lua和C是很容易结合的，使用C为lua写包。
--与Lua中写包不同的是，C包在使用以前必须首先加载并连接，在大多数系统中最容易的实现方式是通过动态连接库机制。
--Lua在一个叫loadlib的函数内提供了所有的动态连接功能。这个函数有两个参数：库的绝对路径和初始化函数。
--典型的调用例子如下:
-- local path="/usr/local/lua/lib/libluasocket.so";
-- local socket=loadlib(path,"luaopen_socket");
--loadlib函数加载指定的库并且连接到Lua,然后它并不打开库(也就是说没有调用初始化函数)，反之它返回初始化函数作为Lua的一个函数。这样我们就可以直接在Lua中调用它。
--如果加载动态库或者查找初始化函数时出错，loadlib将返回nil和错误信息。
--我们可以修改前面一段代码，使其检测错误然后调用初始化函数：
-- local path="/usr/local/lua/lib/libluasocket.so";
-- --或者path="C:\\windows\\luasocket,dll"  -->这是在windows平台下
-- local socket=assert(loadlib(path,"luaopen_socket"))
-- socket();       -->真正打开调用的动态库
--一般情况下我们希望发布库包含一个与前面代码段相似的stub文件，安装二进制库的时候可以随便方在某个目录，只需要修改stub文件对应的二进制库的实际路径即可。
--将stub文件所在的目录加入到LUA_PATH，这样的设置吧以后就可以使用require函数来加载C库啦




