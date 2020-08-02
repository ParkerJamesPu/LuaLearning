-->>>Lua 面向对象编程练习脚本
print("Lua 面向对象编程练习")
Shape={area=0}
--基础类方法
function Shape:new(o,side)
    o=o or {}
    setmetatable(o,self)
    self.__index=self;
    side=side or 0;
    self.area=side*side;
    return o;
end
--基础类方法
function Shape:printArea()
    print("面积为：",Shape.area)
end
myshape=Shape:new(nil,10);
myshape:printArea();
