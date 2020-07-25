-->>>Lua 迭代器

--迭代器(iterator)是一种对象，它能够用来遍历标准模板库容器中的部分或全部元素，每个迭代器对象代表容器中的确定的地址
--lua中迭代器是一种支持指针类型的结构，它可以遍历集合中的每一个元素

--1.泛型for迭代器
--泛型for在自己内部保存迭代函数，实际上它保存三个值：迭代函数，状态常量和控制变量
--泛型for迭代器提供了集合的key/value对，语法格式如下：
-- for k,v in pairs(t) do
--     print(k,v);
-- end
--上面代码中，k,v为变量列表，pairs(t)为表达式列表
--具体实例如下：
-- array={"Lua","Python"};
-- for k,v in pairs(array) do
--     print(k,v);
-- end
--以上实例中我们使用了Lua提供的默认的迭代函数ipairs

--下面我们看看泛型for的执行过程：
--第一，初始值，计算in后面表达式的值，表达式应该返回泛型for需要的三个值：迭代函数，状态常量，控制变量；
--与多值赋值一样，如果表达式返回的结果个数不足三个会自动用nil补足，多出部分会被忽略。
--第二，将状态常量和控制变量作为函数调用迭代函数(注意：对于for结构来说,状态常量是没有用处，仅仅在初始化时获取他的值并传递给迭代函数)
--第三，将接待函数返回的值赋给变量列表
--第四，如果返回的第一个值为nil循环结束，否则执行循环体
--第五，回到第二步再次调用迭代函数
--在Lua中我们常常使用函数来描述迭代器，每次调用该函数就返回集合的下一个元素。Lua的迭代器包含以下两种类型：
--无状态的迭代器和多状态的迭代器

--2.无状态的迭代器
--无状态的迭代器是指不保留任何状态的迭代器，因此在循环中我们可以利用无状态迭代器避免创建闭包花费额外的代价
--每一次迭代，迭代函数都是用两个变量(状态常量和控制变量)的值作为参数被调用，一个无状态的迭代器只利用这两个值可以获取下一个元素
--这种无状态的迭代器的典型例子是ipairs,它遍历数组的每一个元素。
--以下实例我们使用一个简单的函数来实现迭代器，实现数字n的平方：
-- function square(iteratorMaxCount,currentNumber)
--     if currentNumber<iteratorMaxCount then
--         currentNumber=currentNumber+1;
--         return currentNumber,currentNumber*currentNumber;
--     end
-- end
-- for i,n in square,3,0 do
--     print(i,n);
-- end

--迭代的状态包括被遍历的表(循环过程中不会改变的状态常量)和当前的索引下标(控制变量)，ipairs和迭代函数都很简单，我们在Lua中可以这样实现：
--迭代函数实现
-- function iter(a,i)
--     i=i+1;
--     local v=a[i];
--     if v then
--         return i,v;
--     end
-- end
-- --自己实现跌无状态迭代器
-- function myipairs(a)
--     return iter,a,0;
-- end

-- array={"Lua","Python","CSharp"}
-- for k,v in myipairs(array) do
--     print(k,v);
-- end
--当Lua中调用myipairs(a)开始循环时，他获取三个值：迭代函数iter、状态常量a,控制变量初始值0；
--然后Lua调用iter(a,0)返回1，a[1](除非a[1]=nil);
--第二次迭代调用iter(a,1)返回2，a[2].....在古代第一个元素为nil元素

--3.多状态的迭代器
--很多情况下,迭代器需要保存多个状态信息而不是简单的状态常量和控制变量，最简单的方法是使用闭包，还有一种方法就是将所有的状态信息都封装到table内，将table作为迭代器的迭代常量，
--因为这种情况下可以将所有的信息存放在table内，所以迭代函数通常不需要第二个参数
--以下实例我们创建了自己的迭代器：
-- array={"Lua","Python","CSharp"}
-- --实现自己的迭代器函数
-- function elementIterator(collection) 
--     local index=0;
--     local count=#collection;
--     --实现闭包函数
--     return function()
--         index=index+1;
--         if index <= count then
--             --返回迭代器的当前元素
--             return collection[index];
--         end
--     end
-- end
-- --调用自己实现的多状态的迭代器函数
-- for v in elementIterator(array) do
--     print(v);
-- end
--elementIterator 自定义多状态迭代函数中使用了闭包函数，实现计算集合大小并输出各个元素










