-->>>lua函数

--在lua中，函数时对语句和表达式进行抽象的主要方法。既可以用来处理一些特殊的工作中，也可以用来计算一些值
--lua提供了许多的内建函数，你可以很方便的在程序中调用他们，如print()函数可以将传入的参数打印在控制台上。
--lua函数的主要用途：
--A.完成指定的任务，这种情况函数作为调用语句使用；
--B.计算并返回值，这种情况下函数作为赋值语句的表达式使用；

--1.函数的定义：
--lua编程语言函数定义格式如下：
-- optional_function_scope function function_name(argument1,argument2,argument3...,argumentn)
--     function_body
--     return result_params_comma_separated
-- end
--解析：
--optional_function_scope：该参数时可选的制定函数是全局函数还是局部函数，
---------------------------未设置该参数的默认为全局函数，如果把你需要设置函数为局部函数需要使用关键字local
--function_name:指定函数名
--argument1,argument2,argument3...,argumentn:函数参数，多个和参数以逗号分开，函数也可以不带参数
--function_body:函数体，函数中需要执行的代码语句块。
--result_params_comma_separated:函数返回值。lua语言函数可以返回多个值，每个值以逗号隔开。
--函数示例：比较参数num1,num2大的大小，并返回最大值
-- function max(num1,num2)
--     if(num1>num2) then
--         result=num1;
--     else 
--         result=num2;
--     end
--     return result;
-- end
-- print("比较两个值的大小：",max(10,3));
-- print("两值比较最大值为：",max(5,25));
--注意：lua中我们可以将函数作为参数传递给函数：示例如下：
-- myprint=function(param)
--     print("这是自定义打印函数:"..param);
-- end

-- function add(num1,num2,functionPrint)
--     result=num1+num2;
--     functionPrint(result);      --调用传递的函数参数
-- end

-- myprint(10);
-- add(3,6,myprint);

--2.多返回值
--lua函数可以返回多个结果值，比如string.find,其中返回匹配串‘开始和结束的下标’（如果你不存在匹配返回nil）
--lua函数被中，在return后列出要返回的值的列表即表可返回多值，示例如：
-- function maxinum(a)
--     local index=1;          --最大索引值
--     local m=a[index];       --最大值
--     for k,v in ipairs(a) do
--         if(v>m) then
--             index=k;
--             m=v;
--         end
--     end
--     return index,m;
-- end
-- print(maxinum({5,7,78,56,24}));


--3.可变参数
--lua参数可以接受可变数目的参数，和C语言类似，在哈数参数列表中使用三点...表示函数有可变的参数
-- function add(...)
--     local s=0;
--     for i,v in ipairs{...} do        --注意：{...} 表示一个由所有变长参数构成的数组
--         s=s+v;
--     end
--     return s;
-- end
-- print(add(3,4,5,6,7));
--对于可变参数，我们可以将可变参数赋值给一个变量，
--例如，计算几个数的平均值：
-- function average(...)
--     result=0;
--     local arg={...};        -->arg 为一个表，局部变量
--     for i,v in ipairs(arg) do
--         result=result+v;
--     end
--     print("总共输入的参数个数为："..#arg)
--     return result/#arg;      -->#arg获取可变参数arg的数量
-- end
-- print("求平均数：",average(3,4,5,6,7));

--注意：lua中也可以使用select("#",...)来获取可变参数的数量
-- function average(...)
--     result=0;
--     local arg={...};        -->arg 为一个表，局部变量
--     for i,v in ipairs(arg) do
--         result=result+v;
--     end
--     print("总共输入的参数个数为："..select("#",...))   -->select("#",...)代表获取可变参数的长度
--     return result/select("#",...);      
-- end
-- print("求平均数：",average(3,4,5,6,7));

--注意：有时候我们需要几个固定参数加上可变参数，固定参数必须方在可变参数之前：
-- function fwrite(fmt,...)        -->固定参数fmt
--     return io.write(string.format(fmt,...))
-- end
-- fwrite("pxq\n")          -->fmt=pxq,没有可变参数
-- fwrite("%d%d\n",1,2)        -->fmt=“%d%d”,变长参数为1和2

--通常在遍历变长参数的时候只需要使用{...}，然而变长参数可能会包含一些nil类型的值，那么就可以用
--select函数来访问变长参数啦：select("#",...)或者select(n,...)
--selct("#",...) 返回可变参数的长度
--select(n,...) 用于访问n到slect("#",...)的参数
--注意：调用select时，必须传入一个固定的参数selector(选择开关)和一系列变长参数。如果slector为数字n,那么select返回它的第n个可选参数，
-------否则只能为字符串“#”,这样select会返回变长参数的总数，例如：
-- do
--     function foo(...)
--         for i=1,select("#",...) do      -->select("#",...) 代表获取参数总数
--             local arg=select(i,...);     -->获取参数
--             print("arg:",arg);
--         end
--     end
--     foo(1,2,3,4,5);
-- end
           


