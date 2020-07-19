-->>>lua 数据类型


--lua 是动态类型语言，变量不要类型定义，只需要为变量赋值。值可以存储再变量中，作为参数传递或结果返回
--lua 中有8个基本数据类型分别为：nil/boolean/number/string/userdata/function/thread/table"
--nil:代表无效值
--boolean:代表布尔值false和true  
--number:代表双精度类型的实浮点数
--function:代表由c或lua编写的函数
--userdata:代表任意存储在变量中的c数据结构
--thread：代表执行的独立线炉，用于执行协助程序
--table:代表在lua中的表，其实是一种关联数组，数组的索引可以是数字或者字符串。在lua 中，table的创建时通过‘构造表达式’来完成的，最简单的构造表达式时‘{}’，用来创建一个空表
--注意：一般约定，以下划线开头连接一串大写字母的变量（比如：_VERSION）被保留为lua内部的全部变量

--单行注释：两个减号时单行注释--
--多行注释：--[[多行注释的内容--]]

--示例：可以用type函数测试给定变量或者指的类型
--[[
print(type("Hello World"));     --string
print(type(10.4*3));            --number
print(type(print));             --function
print(type(true));              --boolean
print(type(nil));               --nil
print(type(type(x)));           --string
--]]

--1.全局变量
--注意：在默认情况下，变量总是认为是全局变量
--全局变量不需要声明，给一个全局变量赋值后即创建了这个全局变量，访问一个没有初始化的全局变量你也不会报错
--只不过输出结果为：nil 示例如下：
--[[
print(b);       --nil
b=10;
print(b);       --10
--]]

--2.nil （空、无效值）
--nil 类型表示一种没有任何有效值，它只是一个值--nil,例如打印一个没有赋值的变量，便会输出一个nil值：
--print(type(a));     --nil

--注意：对于全局变量和table，nil还有一个“删除”作用，给全局变量或者table表里的变量赋值为nil值，等同于
--把它们删除，示例如下：
--[[
table1={key1="value1",key2="table2","value3"}
for k,v in pairs(table1) do
    print(k.."-"..v);
end
table1.key1=nil;
for k,v in pairs(table1) do
    print(k.."-"..v);
end
--]]

--nil 作比较时应该加上双引号“nil”
--[[
print(type(x));         --nil
print(type(x)==nil);    --false 比较不相等的原因是：type(x)==null 相当于type(type(x))==string 
print(type(x)=="nil");  --true
--]]

--3.boolean (布尔值)：这种数据类型有两个可选值：true（真）和false（假） ,注意：lua 把false和nil都看作是‘假’。其他都为‘真’
--[[
print(type(true));
print(type(false));
print(type(nil))
if false or nil then
    print("至少一个是true");
else
    print("false 和 nil 都是false");
end
--]]

--4.number(数字)
--lua 默认只有一种number类型，double 双精度类型（默认类型可以系应该luaconf.h里的定义）
--以下几种写法都被认为是number 类型
--[[
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.898002-06))
--]]

--5.string(字符串)
--字符串是由一对双引号或者单引号来表示的
--str1="this is string 1";
--str2="this is string 2";
--注意:也可以用2两个方括号“[[]]”来表示“一块”字符串
--例如：
--[[
html=[[
<html>
<head></head>
<body>
    <a href="www.baidu.com">百度一下，你就知道</a>
</body>
</html>
]]
--]]
--print(html);
--注意：在对一个数字字符串进行算数运算操作时，lua 会尝试将这个数字字符串转换成一个数字:
--[[
print("2"+6);
print("6"-"2");
print("3"*"4");
print(8/"2");
--]]
--注意：lua中字符串之间的连接使用符号‘..’;而不是‘+’，‘+’代表加号的意思
--print("a".."b".."c");
--lua 中使用#号来计算字符串的长度，使用时方在字符串的前面。例如：
--print(#"HelloWorld");


--6.table(表)
--在lua中，table的创建时通过‘构造表达式’来完成的。最简单的构造表达式时{}，用来创建一个空表。也可以在表里面添加一些数据来直接初始化表。
--lua中的表是一个关联数组，数组的索引可以是数字或者字符串
--例如创建一个空表
-- local table={};
-- print(table);
--例如直接初始化表
--local tbl2={"apple","orange","grape"};
-- local tbl3={};
-- tbl3["key"]="value";
-- key=10;
-- tbl3[key]=22;
-- tbl3[key]=tbl3[key]+11;
-- for k,v in pairs(tbl3) do
--     print(k..":"..v);
-- end
--注意:不同于其他语言的数组把0作为数组的初始索引，在lua中的表的初始索引一般以1开始
-- local tbl4={"apple","pear","orange","grape"}
-- for k,v in pairs(tbl4) do
--     print("key:"..k);
-- end
--注意：lua中table不会固定长度，有数据添加时table长度会自动增长，没初始化的table都是nil
-- local tbl5={};
-- for i=1,10 do
--     tbl5[i]=i;
-- end
-- tbl5["key"]="val";
-- print(tbl5["key"]);
-- print(tbl5[9]);
-- print(tbl5["none"]);        --没有初始化的table都是nil

--7.function(函数)
--在lua中，函数被看作是‘第一个类值’，函数可以存在变量里
-- function factoriall(n)
--     if n==0 then
--         return 1;
--     else 
--         return n*factoriall(n-1);
--     end
-- end
-- print(factoriall(5));
-- factoriall2=factoriall;
-- print(factoriall2(5));
--注意：function可以以匿名函数的方式通过你参数传递
-- function testFunc(tbl,func)
--     for k,v in pairs(tbl) do
--         print(func(k,v));
--     end
-- end
-- tab={key1="value1",key2="value2"};
-- testFunc(tab,
--     function(key,value)     --匿名函数
--         return key.."="..value;
--     end
-- );

--8.thread(线程)
--在lua中，最主要的线程是协同程序（coroutine）.它跟线程（thread）差不多，拥有自己的独立栈，局部变量和指针，可以跟其他协同程序共享全局变量和其他大部分东西。
--线程和协程的区别：线程是可以同时运行多个，而协程任意时刻只能运行一个，并且处于运行状态的协程只有被挂起时才会暂停

--9.userdata(自定义类型)
--userdata是一种用户自定义的数据，用于表示一种由应用程序或c/c++语言库所创建的类型，可以将任意c/c++的任意数据类型的数据（通常是stuct和指针）存储到lua变量中调用

