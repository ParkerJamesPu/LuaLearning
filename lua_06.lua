-->>>Lua 运算符

--运算符是一个特殊的符号，用于高速解释器执行特定的数学或者逻辑运算。lua提供了一下集中运算符类型：

--1.算术运算符：+,-,*,/,%,^,-
-- a=21;
-- b=10;
-- print("加法运算："..a+b);
-- print("减法运算："..a-b);
-- print("乘法运算："..a*b);
-- print("除法运算："..a/b);
-- print("取余运算："..a%b);
-- print("乘幂运算："..b^2);
-- print("取负运算："..-a);

--2.关系运算符：==,~=(不等于),>,<,>=,<=
-- a=21;
-- b=10;
-- if(a==b) then
--     print("a等于b");
-- else
--     print("a不等于b")
-- end

-- if(a~=b) then
--     print("a不等于b");
-- else
--     print("a等于b")
-- end

-- if(a>b) then
--     print("a大于b");
-- else
--     if(a<b) then
--         print("a小于b");
--     end
-- end

-- if(a>=b) then
--     print("a大于等于b");
-- else
--     if(a<=b) then
--         print("a小于等于b");
--     end
-- end

-- --3.逻辑运算符：and-逻辑与操作符；or-逻辑或操作符；not-逻辑非操作符
-- a=true;
-- b=true;      -->通过更改b=true 或b=false 可以控制一下运算得到不同的结果
-- if(a and b) then
--     print("a and b:true");
-- else 
--     print("a and b:false")
-- end

-- if(a or b) then
--     print("a or b :true")
-- else 
--     print("a or b：false")
-- end

-- if(not(a and b)) then
--     print("not(a and b) :true")
-- else 
--     print("not(a and b) :false")
-- end

--4.其他运算符
--..连接两个字符串
--#一元运算符，返回字符串或表的长度
-- a="Hello";
-- b="World";
-- print(a..b);
-- print(#a);
-- print(#b);



