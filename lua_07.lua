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
--%c:接受一个数字，并将其转化成ASCII码表中对应的字符
--%d,%i:接受一个数字并将其转化为有符号的整数格式
--%o:接受一个数字并将其转化为八进制数格式
--%u:接受一个数字并将其转化为无符号的整数格式
--%x：接受一个数字并将其转化为十六进制数格式，使用小写字母
--%X：接受一个数字并将其转化为十六进制数格式，使用大写字母
--%e:接受一个数字并将其转化为科学计数法格式，使用小写字母e
--%E:接受一个数字并将其转化为科学计数法格式，使用大写字母E
--%f:接受一个数字并将其转化为浮点数格式
--%g(%G):接受一个数字并将其转化为%e(%E)及%f中较短的一种格式
--%q:接受一个数字并将其转化为可安全被Lua编译器读入的格式
--%s:接受一个字符串并按照给定的参数格式化改字符串
--注意：为进一步细化格式，可在%号后面添加参数，参数将以如下顺序读入：
--A.符号：一个+号表示其后面的数字转义符将让正数显示正号，默认情况下只有负数显示符号
--B.占位符：一个0，在后面指定了字符串宽度时占用，不填时的默认占位符时是空格
--C.对齐标识：在指定了字符串宽度时，默认为右对齐，增加-号可以更改为左对齐
--D.宽度数值
--E.小数位数/字符串裁切：在宽度数值后增加小数部分n,若后接f(浮点数转义符，如%6.3f),则设定浮点数的小数值保留n位，若后接s(字符串转义符，如%5.3s),则设定的字符串值显示前n位
-- str1="Lua";
-- str2="Tutorial";
-- num1=10;
-- num2=20;
-- --基本字符串转化
-- print(string.format("基本字符串转化：%s,%s",str1,str2));
-- --日期格式化
-- data=23;
-- month=7;
-- year=2020;
-- print(string.format("日期格式化：%03d-%02d-%02d",year,month,data));
-- --十进制格式化
-- print(string.format("%.4f",1/3));

-- print(string.format("%c",97));      -->a
-- print(string.format("%+d",17.0))    -->+17
-- print(string.format("%05d",17))     -->00017 其中0是当不足5位数时的占位符，若不填写，则默认用空格作为占位符
-- print(string.format("%o",17))       -->八进制数：21
-- print(string.format("%u",10))       -->10(无符号整数)
-- print(string.format("%x",10))       -->十六进制a
-- print(string.format("%X",10))       -->十六进制A
-- print(string.format("%e",1000))     -->1.000000e+03
-- print(string.format("%E",1000))     -->1.000000E+03
-- print(string.format("%0.3f",13))    -->13.000
-- print(string.format("%q","One\nTwo"))   
-- print(string.format("%s","monkey")) -->monkey
-- print(string.format("%010s","monkey"))   -->    moneky   (代表总共10位字符，monkey为5位，不足10位，前面默认补齐4位空格（若为：%010s，则在前面补齐4位0，而不是空格）)
-- print(string.format("%5.3s","monkey"))   -->  mon   


--6.字符与整数相互转换
-- --转换第一个字符：
-- print(string.byte("Lua"))       -->不指定索引，默认转换第一位字符转换为ASCII字符对应的十进制整数  76
-- --转换第三个字符
-- print(string.byte("Lua",3))     -->转换指定索引的字符转换为ASCII码对应的十进制整数  97
-- --转换末尾第一个字符
-- print(string.byte("Lua",-1))    -->97
-- --转换第二个字符
-- print(string.byte("Lua",2))     -->117
-- --转换末尾第二个字符
-- print(string.byte("Lua",-2))    -->117
-- --将整数转换为ASCII码中对应的字符
-- print(string.char(97))         -->a
-- print(string.char(65))         -->A


--7.其他常用函数
-- str1="www.";
-- str2="baidu";
-- str3=".com"
-- --使用..连接字符串
-- print(str1..str2..str3);
-- --计算字符串的长度
-- print(string.len(str1));
-- --字符串赋值两次
-- print(string.rep(str2,2));

--8.匹配模式
--Lua中的匹配模式直接使用常规的字符串来描述。
--它用于模式匹配函数：string.find/string.gmatch/string.gsub/string.match
--还可以在模式串中使用字符类。
--字符类指可以匹配一个待定字符集内任何字符的模式项。
--比如：字符类%d匹配任意数字。
--比如：可以使用模式串%d%d/%d%d/%d%d%d%d 搜索dd/mm/yyyy格式的日期
-- s="Deadline is 24/07/2020,firm";
-- pattern="%d%d/%d%d/%d%d%d%d";
-- print(string.sub(s,string.find(s,pattern)))         -->21/07/2020











