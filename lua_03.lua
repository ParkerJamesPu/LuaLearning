-->>>lua 循环

--一组被重复执行的语句称为循环体，能否继续重复，决定循环的终止条件
--循环结构是在一定条件下反复执行某段程序的流程结构，被反复执行的程序成为循环体。
--循环语句是由循环体和循环的终止条件两部分组成的。
--Lua语言提供了以下几种循环处理方式：
--while循环：在条件为true时，让程序重复执行某些语句。执行语句前会先检查条件是否为true
--for循环：重复执行指定语句，重复次数可在for循环的语句中控制
--repeat...until循环：重复执行循环，直到指定的条件为真为止；
--循环嵌套：可以在循环内嵌套一个或者多个循环语句（while do...end;for...do;repeat...until;）

--1.while循环
--lua编程语言中while循环语法如下：、
-- while(condition)
-- do
--     statements
-- end
--while循环示例如下：
-- a=10;
-- while(a<20)
-- do
--     print("a的值为:"..a);
--     a=a+1;
-- end

--2.for循环
--lua编程语言中for语句由两大类：数值for循环和泛型for循环

--A.数值for循环的语法格式如下：
-- for var=exp1,exp2,exp3 do
--     <执行体>
-- end
--var 从exp1变化到exp2,每次变化以exp3为步长递增var,并执行一次"执行体".
--exp3是可选的，如果不指定，默认为1.
--for数值循环示例如下：
-- for i=1,10 do
--     print(i);
-- end
-- for i=10,1,-1 do
--     print(i);
-- end
--数值for循环的for的三个表达式再循环开始前一次性求值，以后不再进行求值。
--示例如下，f(x)只会在循环开始前执行一次，其结果用在后面的for循环之中
-- function f(x)
--     print("f(x):"..x);
--     return x*2;
-- end
-- for i=1,f(5) do
--     print(i);
-- end

--B.泛型for循环(相当于C#语言中foreach)
--泛型for循环通过一个迭代器函数来遍历所有的值，类似C#中的foreach语句
--lua编程语言中的泛型for循环语法如下：
--a = {"one","two","three"}
-- for k,v in ipairs(a) do
--     print(k..":"..v);
-- end
--k是数组索引值，v是对应索引的数组元素值。ipairs是lua提供的一个迭代器函数，用力啊迭代数组
-- days={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}
-- for k,v in ipairs(days) do print(k,v) end


--3.repeat...until循环（相当于C#语言中的do...while循环）
--lua 编程语言中，repeat...until循环语句不同于for he while循环，for和while循环的条件语句在当前循环开始时判断，而repeat...until循环的条件语句在当前循环接受执行
--lua编程语言中，repeat...until循环语法格式如下：
-- repeat
--     statements
-- until(condition)
--在执行循环条件判断语句（condition）在循环尾部末尾，所以在条件进行判断前循环体都会执行一次。
--如果条件判断语句（condition)为false.循环会重新开始，知道条件判断语句（condition)为true才会停止循环
--示例如下：
-- a=10;
-- repeat 
--     print(a)
--     a=a+1;
-- until(a>15)

--4.循环嵌套
--lua循环嵌套其中包括for循环、while循环和repeat...until循环之间的嵌套

--5.循环控制语句
--循环控制语句用于控制循环程序的流程，以实现程序的各种结构方式
--lua支持break循环控制语句
--break语句：退出当前循环或语句，并开始脚本执行紧挨着的语句
--break循环控制语句示例：
-- a=10;
-- while(a<20)
-- do
--     print("a:"..a);
--     a=a+1;
--     if(a>15) then
--         break;
--     end
-- end

--6.无限死循环
--在循环体中如果条件永远为true,则循环语句就会永远的执行下去，例如以while循环为例：
-- while(true) do
--     print("while无限循环中....");
-- end


