--->Lua 文件I/O 读写简单模式代码练习

--以只读方式打开
-- file=io.open("test.lua","r");
-- --设置默认的输入文件为test.lua
-- io.input(file);
-- --输出文件第一行
-- print(io.read())
-- --关闭打开的文件
-- io.close(file);

--以附件的方式打开只写文件
-- file=io.open("test.lua","a")
-- --设置默认输出文件为test.lua
-- io.output(file);
-- --在文件最后一行添加Lua注释
-- io.write("-- test.lua 写入lua文件末尾注释")
-- --关闭打开的文件
-- io.close(file);

--在以上示例中我们使用了io."x"方法，其中io.read()中我们没有带参数，参数可以是下表中的一个：
--"*n":读取一个数字并返回它。例如file.read("*n")
--"*a":从当前位置读取整个文件。例如：file.read("*a");
--"*|":(默认)读取下一行，在文件尾(EOF)处返回nil。例如file.read("*|")
--number:返回一个指定的字符个数的字符串，或在EOF时返回nil.例如file.read(5)
--其他的io方法有：
--io.tmpfile():返回一个临时文件句柄，该文件以更新模式打开，程序结束时自动删除
--io.type(file):检测obj是否为一个可用的文件句柄
--io.flush():向文件写入缓冲中的所有数据
--io.lines(optional file name):返回一个跌打函数，每次调用将获得文件中的一行内容，当到文件末尾时，将发你会nil,但不关闭文件
