--@name Multiple screen
--@author AstalNeker
--@include multiple screen lib.lua

if CLIENT then
    local msl = require("multiple screen lib.lua")

    local pos = {}
    for i=1, 8 do
        pos[i] = {x=0,y=0} 
    end

    hook.add("ms_render1","",function(screen_id,size,cursor)
        render.setColor(Color(255,0,0))
        
        for i=1, #pos do
            render.drawRect(pos[i].x - 45 + 512,pos[i].y - 45,90,90)
        end
    end)
    hook.add("ms_render2","",function(screen_id,size,cursor)
        render.setColor(Color(0,255,0))
        
        for i=1, #pos do
            render.drawRect(pos[i].x - 45,pos[i].y - 45,90,90)
        end
    end)
    hook.add("ms_render3","",function(screen_id,size,cursor)
        render.setColor(Color(0,0,255))
        
        for i=1, #pos do
            render.drawRect(pos[i].x - 45 - 512,pos[i].y - 45,90,90)
        end
    end)

    hook.add("render","",function()
        --only work with 'render' hook
        msl.update(false) --screen_id = msl.update(show_id)
        
        for i=1, #pos do
            pos[i] = {x=256+math.cos((i/#pos) * (math.pi*2) + timer.curtime()/2) * 512,y=256 + math.sin((i/#pos) * (math.pi*2) + timer.curtime()/2) * 200}
        end
    end)
end
