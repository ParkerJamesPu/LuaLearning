-->>>Lua 数组

--数组就是相同数据类型的元素按照一定的顺序排列的集合，可以是一维数组和多维数组。
--Lua数组的索引键值可以使用整数表示，数组的大小不是固定的

--1.一维数组
--一维数组是最简单的数组，其逻辑结构是线性表。一维数组可以for循环遍历数组中的元素，如下示例：
--array={"Lua","Python","CSharp"};
-- for i,v in ipairs(array) do
--     print(i,v);
-- end

-- for i=1,#array do
--     print(array[i]);
-- end
--注意：lua中索引值是从1开始的，不是从0开始的


--2.多维数组
--多维数组即数组中包含数组或一维数组的索引键对应的一个数组
--例如，以下是一个三行三列的阵列多为数组
-- array={};       -->初始化数组
-- for i=1,3 do
--     array[i]={};
--     for j=1,3 do
--         array[i][j]=i*j;
--     end
-- end
-- --遍历多维数组
-- for i=1,#array do
--     for j=1,#array[i] do
--         print(i,j,array[i][j]);
--     end
-- end
--不同索引键的三行三列阵列多维数组：
-- array={};
-- maxRows=3;
-- maxColums=3;
-- for row=1,maxRows do
--     for col=1,maxColums do
--         array[row*maxColums+col]=row*col;
--     end
-- end
-- --遍历多维数组
-- for row=1,maxRows do
--     for col=1,maxColums do
--         print(row,col,array[row*maxColums+col]);
--     end
-- end



    