-->>>Lua 元表(Metatable)

--在Lua table中我们可以访问对应的key来得到value值，但是却没有办法对两个table进行操作。
--因此Lua提供了元表(matetable),允许我们改变table的行为，每个行为关联了对应的元方法。
--例如：使用元表我们可以定义Lua如何计算两个table的相互操作a+b
--当Lua试图对两个表进行相加时，先检查两者之一是否有元表，之后检查是=是否有一个叫"__add"的字段，
--若找到，则调用对应的值。"__add"等即使字段，其对应的值(往往是一个函数或者table)就是元方法。
--有两个很重要的函数来处理元表：
--setmetatable(table,metatable)：对指定的table设置元表(metatable)，如果元表(metatable)中存在_metatable键值，setmetatable会失败。
--getmetatable(table):返回对象的元表(metatable)
--以下示例演示了如何对指定的表设置元表：
--mytable={};         -->普通表
--mymetatable={};     -->元表
--setmetatable(mytable,mymetatable)       -->把mytmetatable设为mytable的元表
--以上代码也可以直接写成一行：
--mytable=setmetatable({},{});
--以下为返回对象元表
--getmetatable(mytable);          -->返回mymetatable

--1.__index元方法
--这是metatable最常用的键
--当你通过键来访问table的时候，如果这个键没有值，那么Lua就会寻找该table的的metatable(假定有metatable)中的__index键。
--如果__index包含一个表格，Lua会在表格中查找相应的键。
--我们可以在使用lua命令进入交互模式查看：
-- other={foo=3};
-- t=setmetatable({},{__index=other})
-- print(t.foo);
--如果__index包含一个函数的话，Lua就会调用那个函数，table和键会作为参数传递给函数。
--*重点理解*：__index元方法查看表中元素是否存在，如果不存在，返回结果nil；如果存在则由__index返回结果。
-- mytable=setmetatable({key1="value1"},{__index=function(mytable,key)
--     if(key=="key2") then
--         return "metatablevalue";
--     else
--         return nil;
--     end
-- end
-- })
-- print(mytable.key1,mytable.key2);
--实例解析：
--mytable 表赋值为{key1="value1"}
--mytable 设置了元表，元方法为__index
--在mytable表中查找key1,如果找到，返回该元素，找不到则继续
--在mytable表中查找key2.如果找到，返回metatablevalue,找不到则继续
--判断元表中有没有__index方法，如果__index方法时一个函数，则调用该函数
--元方法中查看是否传入"key2"键的参数(mytable.key2已设置)，如果传入"key2"参数返回"metatablevalue",否则返回mytable对应的键值
--我们可以将以上方法简写为：
-- mytable=setmetatable({key1="value1"},{__index={key2="metatblevalue"}});
-- print(mytable.key1)
-- print(mytable.key2)
--*__index元方法总结*：
--Lua中查找一个表元素的规则，其实就是如下三个步骤：
--(1)在表中查找，如果找到，返回该元素，找不到则继续
--(2)判断该表是否有元素，如果没有元素，返回nil,有元素则继续
--(3)判断元表有没有__index方法，如果__index方法为nil,则返回nil;
-----如果__index方法是一个表，则重复(1)(2)(3);
-----如果__index方法是一个函数，则返回该函数的返回值。


--2.__newindex元方法
--*******__newindex元方法用来对表更新，__index则用来对表访问******
--当你给表的一个缺少的索引赋值，解释器就会查找__newindex元方法；
--如果存在则调用这个函数而不进行赋值操作。
--以下实例演示了__newindex元方法的应用：
--[[
mymetatable={};
mytable=setmetatable({key1="value1"},{__newindex=mymetatable});
print(mytable.key1)
mytable.newkey="新值2";
print(mytable.newkey,mymetatable.newkey);
mytable.key="新值1";
print(mytable.key1,mymetatable.key1)
]]
--以上实例中表设置了元方法__newindex,在对新索引键(newkey)赋值时(mytable.newkey="新值2")，会调用元方法，
--而不进行赋值。而如果对已存在的索引键（key1),则会机进行赋值，而不调用元方法__newindex.
--个人简单理解：
--如果表设置了元表，则对表中不存在的索引赋值时会调用元方法__newindex，导致的结果时：通过元表的索引访问则会存在赋值的结果，而通过表中不存在的索引访问则会返回nil
--如果表设置了元表，则对表中存在的索引赋值时，则会直接进行赋值，而不调用元表的元方法，导致的结果是表中的对应的索引的值会被更改，而通过元表访问对应的索引会返回nil

--以下实例通过rawset函数来实现更新表：
-- mytable=setmetatable({key1="value1"},{
--     __newindex=function(mytable,key,value)
--         rawset(mytable,key,"\""..value.."\"")
--     end
-- })
-- mytable.key1="new value1";
-- mytable.key2=4;
-- print(mytable.key1,mytable.key2);
-- --使用rawset对表进行赋值，如果表中存在索引，则会直接更改索引对应的值；若表中不存在索引们则会创建索引并对索引对应的值进行赋值
-- for i,v in pairs(mytable) do
--     print(i,v);
-- end

