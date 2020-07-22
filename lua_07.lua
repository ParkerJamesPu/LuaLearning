-->>> Lua 字符串

--字符串或者串（String）是由数字、字母、下划线组成的一串字符。
--Lua语言中字符串可以使用一下三种方式来表示：
--A.单引号的一串字符
--B.双引号的一串字符
--C.[[]]之间的一串字符
--示例如下：
-- str1='Hello World 1';
-- str2="Hello World 2";
-- str3=[[Hell World 3]];
-- print(str1,str2,str3);

--1.字符串转义字符
--转义字符用于表示不能直接显示的字符，比如后退键，回车键等
--Lua中所有的转义字符如下：
--\a    响铃（BEL）
--\b    退格（BS）,将当前位置移动前一列
--\f    换页（FF）,将当前位置移到下页开头
--\n    换行（LF）,将当前位置移到下一行开头
--\r    回车（CR），将当前位置移到本行开头
--\t    水平制表（HT)，跳到下一个TAB位置
--\v    垂直制表（VT），
--\\    代表一个反斜线字符“\”
--\`    代表一个单撇号字符
--\"    代表一个双引号
--\0    代表一个空字符（Null）
--\ddd  代表1到3位八进制所代表的任意字符
--\xhh  代表1到2位十六进制所代表的任意字符

--2.字符串操作

--2.1-string.upper(argument):字符串全部转为大写字母
--print(string.upper("hello"));

--2.2-string.lower(argument):字符串全部转为小写字母
--print(string.lower("HELLO"));

--2.3-string.gsub(mainString,findString,replaceString,num):
--在字符串中替换，mainstring为要替换的字符串；findString为被替换的字符，replaceString为要替换的字符
--num为要替换的次数（可忽略，则代表全部替换）
-- str=string.gsub("www.baidu.com","w","-",2)      --将匹配到的w字符的前2个替换为-字符
-- print(str);

--2.4-string.find(str,substr,[init,[end]])
--在一个指定的目标字符串中搜索除指定的内容(第三个参数为索引)，返回具体的位置。若不存在则返回nil
-- str_target="Hello Lua";
-- str_find="Lua";
-- result=string.find(str_target,str_find,1);
-- print(result);

--2.5-string.reverse(arg):字符串反转
-- print(string.reverse("Lua"))    -->auL

--2.6-string.format(...):返回一个类似printf的格式化字符串
--print(string.format("the value is:%d",4));

--2.7-string.char(arg)和string.byte(arg[,int])
--char是将整型数字(对应ASCII)转换成字符串并连接；byte是将字符(对应ASCII码)转换成整数(可以指定某个字符，默认为第一个字符)
-- print(string.char(97,98,99));       -->abc
-- print(string.byte("ABCD",2));       -->66 (A-65,B-66,C-67,D-68)

--2.8-string.len(arg):计算字符串的长度
-- print(string.len("Hello"));
-- print(#"Hello");        -->#同样也可以用来计算字符串长度

--2.9-string.rep(string,n):返回字符串string的n个拷贝
--print(string.rep("Hello",2));       -->HelloHello

--2.10-..连接两个字符串
--print("www.baidu"..".com");     -->www.baidu.com

--2.11-string.gmatch(str,pattern)
--迭代器函数，每一次调用这个函数，返回一个在字符串str找到的下一个符合pattern描述的子串。
--如果参数pattern描述的字符串没有找到，迭代函数返回nil
-- for word in string.gmatch("Hello Lua user","%a+") do
--     print(word)
-- end

--2.12-string.match(str,pattern,init)
--string.match()只寻找源字串str中的第一个配对，参数init可选，指定搜寻过程的起点，默认为1
--在成功配对时，函数将返回配对表达式中的所有的捕获结果；如果没有设置捕获标记，则返回整个配对字符串，当没有成功配对时，返回nil
-- print(string.match("I have 2 questions for you.","%d+ %a+"));

--3.字符串大小写转换
-- str1="Lua";
-- print(string.upper(str1));
-- print(string.lower(str1));

--4.字符串查找与反转
-- str="Lua Tutorial";
-- --查找字符串
-- print(string.find(str,"Tutorial"));
-- print(string.reverse(str));

--5.字符串格式化
--Lua 提供了string.format()函数来生成具有特殊格式的字符串，函数被的而第一个参数是格式，之后是对应格式中每个代码的各种数据。
--由于格式字符串的存在，使得产生的长字符串可读性大大提高了。这个函数的格式很像c语言中的printf()
--格式化字符串可能包含的转义码如下：





