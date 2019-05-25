local breakInfoFun, xpcallFun = require("LuaDebugjit")("localhost", 7003)
    cc.Director:getInstance():getScheduler():scheduleScriptFunc(breakInfoFun, 0.5, false)

cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"

local function main()
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
