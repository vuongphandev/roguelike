------------
-- UPDATES
------------
function update_game()
    do_button_buffer()
    do_button(button_buffer)
    button_buffer = -1
end


-- move anim
function update_pturn()
    do_button_buffer()
    -- change speed
    p_timer = min(p_timer + 0.2, 1)

    p_mov() -- mov walk/bump

    if p_timer == 1 then
        _upd=update_game
    end
end


function update_gameover()
end


function mov_walk()
    -- s:starting
    p_ox = p_sox * (1 - p_timer)
    p_oy = p_soy * (1 - p_timer)
end


-- bump against walls
function mov_bump()
    local timer = p_timer

    if p_timer > 0.5 then
        timer = 1 - p_timer
    end
    p_ox = p_sox * (timer)
    p_oy = p_soy * (timer)
end


function do_button_buffer()
    if button_buffer == -1 then
        button_buffer = get_button()
    end
end


function get_button()
    for i = 0,5 do
        if btnp(i) then
            return i
        end
    end
    return -1
end


function do_button(button)
    if button < 0 then return end

    if button < 4 then
        move_player(dir_x[button+1], dir_y[button+1])
        return
    end
    -- TODO: Menu buttons
end
