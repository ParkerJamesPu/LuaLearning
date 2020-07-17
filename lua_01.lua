-->01>>lua 数据结构学习
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
print(type("Hello World"));     --string
print(type(10.4*3));            --number
print(type(print));             --function
print(type(true));              --boolean
print(type(nil));               --nil
print(type(type(x)));           --string

--注意：默认情况下，变量总是以为时全局变量：全局变量不需要声明，给一个变量赋值后即创建了这个全局变量，访问一个没有初始化的全局变量不会报错，不过得到的结果时：nil
