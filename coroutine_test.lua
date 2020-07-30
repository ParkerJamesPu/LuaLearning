--->>>Lua 协程(coroutine)测试脚本

--1.创建和调用协程

--创建协程和启用协程
-- co=coroutine.create(
--     function(i)
--         print(i);
--     end
-- );
-- coroutine.resume(co,1)      -->1
-- print("检查协程状态："..coroutine.status(co))
--另外一种方法创建协程和调用协程,coroutine.wrap创建协程返回的是一个函数方法
-- co=coroutine.wrap(
--     function(i)
--         print(i);
--     end
-- )
-- co(1);
-- print("检查coroutine.wrap创建协程返回的类型："..type(co))       -->function

-- co2=coroutine.create(
--     function()
--         for i=1,10 do
--             print(i);
--             if i==3 then
--                 print(coroutine.status(co2))
--                 print(coroutine.runing())
--             end
--             coroutine.yield();
--         end
--     end   
-- )
-- coroutine.resume(co2)       -->1
-- coroutine.resume(co2)       -->2
-- coroutine.resume(co2)       -->3
-- print(coroutine.status(co2))

--coroutine.runing 就可以看出，coroutine在底层实现了一个线程
--当crate一个coroutine的时候就是在新线程中注册了一个事件
--当使用corutine触发事件的时候，crate的coroutine函数就别执行了，当遇到yield的时候就代表挂起了当前线程，等待再次resume触发事件。
function foo(a)
    print("foo 函数输出："..a);
    return coroutine.yield(2*a);        -->返回2*a的值
end
co=coroutine.create(
    function(a,b)
        print("第一个协程输出：",a,b);
        local r=foo(a+1);
        print("第二个协程输出:",r);
        local r,s=coroutine.yield(a+b,a-b);     -->a,b的值为第一次调用协程时传入
        print("第三个协程输出：",r,s);
        return b,"协程结束";                     -->b为第二次调用协程事传入
    end
)
print("main",coroutine.resume(co,1,10))     
print("--------1---------")
print("main",coroutine.resume(co,"r"))
print("---------2--------")
print("main",coroutine.resume(co,"x","y"))
print("---------3--------")
print("main",coroutine.resume(co,"x","y"))
print("---------4--------")
