--@name Multiple screen user lib
--@author AstalNeker
--@include multiple screen lib.lua

if CLIENT then
    local msl = require("multiple screen lib.lua")
    
    //draw on different screen
    hook.add("ms_render1","",function(screen_id)
        render.setColor(Color(255,0,0))
        render.drawRect(50,50,90,90)
    end)
    hook.add("ms_render2","",function(screen_id)
        render.setColor(Color(0,255,0))
        render.drawRect(512 - 50 - 90,50,90,90)
    end)
    hook.add("ms_render3","",function(screen_id)
        render.setColor(Color(0,0,255))
        render.drawRect(50,512 - 50 - 90,90,90)
    end)
    
    hook.add("render","",function()
        //only work with 'render' hook
        msl.update(true) //msl.update(show_id)

        //draw on all screen
        render.setColor(Color(255,255,0))
        render.drawRect(512 - 50 - 90,512 - 50 - 90,90,90)
    end)
end
