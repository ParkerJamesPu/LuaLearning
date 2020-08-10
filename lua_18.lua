-->>>Lua 面向对象

--面向对象编程(Obiect Oriented Programming,OOP)是一种非常流行的计算机编程架构。
--以下几种语言都支持面向对象编程：C++/Java/Objectove-C/C#/Ruby
--面向对象的特征：
--a.封装：指能够把一个实体的信息、功能、相应都装入一个单独的对象中的特性/
--b.继承：继承的方法允许在不改动源程序的基础上对其进行扩充，这样使得原功能得以保存，而新功能也得以扩展。这有利于减少重复编码，提高软件的开发效率。
--c.多态：同一操作作用于不同的对象，可以有不同的解释，产生不同的执行结果。在它运行的时候，可以通过指向基类的指针，来调用实现派生类中的方法。
--d.抽象：抽象(Abstraction)是简化复杂的现实问题的途径，它可以作为具体问题找到最恰当的类定义，并且可以在最恰当的继承级别解释问题。

--1.Lua中面向对象
--对象由属性和方法组成，Lua中最基本的结构是table,所以需要用table来面熟对象的属性
--lua中的function可以用来表示方法，那么Lua中的类可以通过table+function模拟出来
--至于继承，可以通过metatable模拟出来（不推荐使用，只模式最基本的对象部分时间够用了）
--Lua中的表不仅在某种意义上是一种对象。像对象一样，表也有状态（成员变量）；也有与对象的值独立的本性，特别是拥有两个不同值的对象(table)代表的两个不同的对象；
--一个对象在不同的时候也有不同的值，但它始终是一个对象；与对象类似，表的声明周期与其由什么创建、在那儿创建没有关系。对象有他们的成员函数，表也有：
-- Account={balance=0};
-- function Account.withraw(v)
--     Account.balance=Account.balance-v;
-- end
-- --以上这个定义创建一个新的函数，并且保存在Account对象的withraw域内，下面展示调用:
-- Account.withraw(100.00);
-- print(Account.balance)           -->-100.0
--以下为一个简单示例：
--示例的简单的类包含三个属性：area,length和breadth,printArea方法用于打印计算结果：
-- Rectangle={area=0,length=0,breadth=0};
-- --派生类的方法new
-- function Rectangle:new(o,length,breadth)
--     o=o or {};
--     setmetatable(o,self)
--     self.__index=self;
--     self.length=length or 0;
--     self.breadth=breadth or 0;
--     self.area=length*breadth;
--     return o;
-- end
-- --派生类的方法printArea
-- function Rectangle:printArea()
--     local self=Rectangle;
--     print("矩形的面积为：",self.area)
-- end
-- --创建对象
-- --创建对象是为类的实例分配内存的过程。每个类都有属于自己的内存共享公共数据。
-- r=Rectangle:new(nil,10,20);
-- --访问属性
-- print(r.length)
-- --访问成员函数
-- r.printArea();
--lua面向对象编程的完整实例详情见luaoop.lua脚本
--lua面向对象编程创建新对象示例详情见shape.lua

--2.Lua 继承
--继承是指一个对象直接使用了另外一个对象的属性和方法。继承可用于扩展类的属性和方法。





