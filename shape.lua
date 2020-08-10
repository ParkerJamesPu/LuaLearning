-->>>Lua 面向对象编程练习
shape={area=0}
--基础类方法 new
function shape:new(o,side)
    o=o or {};
    setmetatable(o,self);
    self.__index=self;
    side=side or 0;
    self.area=side*side;
    return o;
end
--基础类方法printArea
function shape:printArea()
    print("面积为：",self.area)
end
--创建新对象
myshape=shape:new(nil,10)
myshape:printArea();        -->面积为：     100






