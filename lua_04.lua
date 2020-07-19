-->>>Lua 流程控制

--lua编程语言流程控制语句通过程序设定一个或多个条件语句来设定。在条件为true时执行指定代码，在条件为false时执行其他代码
--控制结构的条件表达式结果可以时任何值。lua中认为false和nil为假，true和非nil为真。
--lua提供了以下控制结构语句：
--if语句：由一个布尔表达式作为条件判断，其后紧跟其他语句组成
--if...else语句：if语句可以与else语句搭配使用，在if条件表达式为false时执行else语句代码
--if嵌套语句：可以在if或else if中使用一个或多个if或else if语句

--1.if语句
--if语句语法格式如下：
-- if(布尔表达式) then
--     --布尔表达式为true时执行的语句
-- end
--if语句使用示例：
-- a=10;
-- if(a<20) then
--     print("a:"..a.."小于20");
-- end

--2.if...else 语句
--if...else语法格式如下：
-- if(布尔表达式) then
--     --布尔表达式为true时执行
-- else
--     --布尔表达式为false时执行
-- end
--示例如下：
-- a=22;
-- if(a<20) then
--     print("a:"..a.."小于20");
-- else
--     print("a:"..a.."大于等于20");
-- end


--3.if嵌套语句
--if嵌套语句语法合适如下：
-- if(布尔表达式1)then
--     --布尔表达式1为reue时执行代代码块
--     if(布尔表达式2)then
--         --布尔表达式2为true时执行代码块
--     end
-- end


