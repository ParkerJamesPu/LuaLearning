-->Lua 定义模块moduel测试文件
--文件名为module.lua
module={};
--定义一个常量
module.constant="这是一个常量";
--定义一个函数
function module.func1()
    io.write("这是一个共有函数func1\n")
end
local function func2()
    print("这是一个私有函数func2")
end
function module.func3()
    print("调用私有函数");
    func2();
end
return module;