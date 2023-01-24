--@name Multiple screen
--@author AstalNeker
--@include lib/multiple screen lib.txt

if CLIENT then
    local msl = require("lib/multiple screen lib.txt")

    hook.add("ms_render1","",function(screen_id,size,cursor)
        render.setColor(Color(255,0,0))
        render.drawRect(256-20,256-20,40,40)
    end)
    hook.add("ms_render2","",function(screen_id,size,cursor)
        render.setColor(Color(0,255,0))
        render.drawRect(256-20,256-20,40,40)
        
        --show something on cursor pos from screen
        if cursor.visible then
            render.setColor(Color(0,0,255))
            render.drawRect(cursor.x,cursor.y,40,40)
        end
    end)

    hook.add("render","",function()
        --only work with 'render' hook
        msl.update(false) //screen_id = msl.update(show_id)
    end)
end