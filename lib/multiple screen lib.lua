local my_lib = {}
my_lib.screen_ent = {}
my_lib.font = render.createFont("Courier New", 45, 100, true, false, false, false, false, true)

function update(show_id)
    --some value we need to work
    my_lib.show_id = show_id or false
    my_lib.screen_list = chip():getLinkedComponents()
    for _, screen in pairs(my_lib.screen_list) do
        my_lib.screen_ent[screen] = _
    end

    my_lib.res = {}
    my_lib.res.w,my_lib.res.h = render.getResolution()
    my_lib.screen_index = my_lib.screen_ent[render.getScreenEntity()]
    

    my_lib.cursor = {visible=true}
    my_lib.cursor.x, my_lib.cursor.y = render.cursorPos(player())
    if my_lib.cursor.x == nil or my_lib.cursor.y == nil then my_lib.cursor = {x=0,y=0,visible=false} end
    
    --run the hook
    hook.run("ms_render"..my_lib.screen_index,my_lib.screen_index,my_lib.res,my_lib.cursor)

    --show screen id
    if my_lib.show_id then
        render.setColor(Color(255,70,70))
        render.drawRectOutline(0,0,my_lib.res.w,my_lib.res.h)

        render.setColor(Color(255,70,70,150))
        render.drawRect(20,0,60,60)
        render.setFont(my_lib.font)
        render.setColor(Color(255,255,255))
        render.drawSimpleText(20 + 30,0 + 30,tostring(my_lib.screen_index),1,1)
    end

    return my_lib.screen_index
end

return {update=update}