-- please put your ui there :)

--#region Agency
function create_UIBox_smallpox_triscendence()
    return 
    { n = G.UIT.ROOT, config = {align = "cm", minw = G.ROOM.T.w*5, minh = G.ROOM.T.h*5, padding = 0.1, r = 0.1, colour = {G.C.GREY[1], G.C.GREY[2], G.C.GREY[3], 0.7}}, nodes = {
        { n = G.UIT.R, config = { align = "cm", minh = 1, r = 0.3, padding = 0.07, minw = 1, colour = G.C.JOKER_GREY, emboss = 0.1}, nodes = {
            { n = G.UIT.C, config={align = "cm", minh = 1, r = 0.2, padding = 0.2, minw = 1, colour = G.C.L_BLACK}, nodes={
                { n = G.UIT.R, config = {align = "cm", colour = G.C.CLEAR}, nodes = {
                    { n = G.UIT.O, config = {object = DynaText({
                        scale = 1.2, string = localize("k_smallpox_triscendence"), 
                        colours = {HEX("ca202f")}, float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})
                    }}
                }},
                { n = G.UIT.R, config = {align = "cm"}, nodes = {
                    { n = G.UIT.T, config = {text = localize("k_smallpox_select_tri"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                }},
                { n = G.UIT.R, config = {align = "cm", padding = 0.2, colour = G.C.CLEAR}, nodes = {
                    {n=G.UIT.R, config= {align = "cm", minw = 5, padding = 0.1, r = 0.1, hover = true, colour = HEX("ca202f"), button = "smallpox_tri_1", shadow = true}, nodes={
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_1'), scale = 0.5, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_1_desc'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}
                    }},
                    {n=G.UIT.R, config= {align = "cm", minw = 5, padding = 0.1, r = 0.1, hover = true, colour = HEX("ca202f"), button = "smallpox_tri_2", shadow = true}, nodes={
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_2'), scale = 0.5, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_2_desc'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}
                    }},
                    {n=G.UIT.R, config= {align = "cm", minw = 5, padding = 0.1, r = 0.1, hover = true, colour = HEX("ca202f"), button = "smallpox_tri_3", shadow = true}, nodes={
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_3'), scale = 0.5, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_3_desc'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}
                    }},
                }},
                {n=G.UIT.R, config={id = 'overlay_menu_back_button', align = "cm", minw = 2.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.ORANGE, button = "exit_overlay_menu", shadow = true, focus_args = {nav = 'wide', button = 'b'}}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.UI.TEXT_LIGHT, shadow = true, func = 'set_button_pip', focus_args = {button = 'b'}}}
                    }}
                }}
            }},
        }},
    }}
end

local function triscendence(cards, effect)
    G.CONTROLLER.locks.frame_set = true
    G.CONTROLLER.locks.frame = true
    G.CONTROLLER:mod_cursor_context_layer(-1000)
    G.OVERLAY_MENU:remove()
    G.OVERLAY_MENU = nil
    G.VIEWING_DECK = nil
    G.SETTINGS.paused = false

    for k, v in ipairs(cards) do
        if effect == 1 and k == 1 then v.ability.extra.threes = 27 end
        if effect == 2 then 
            ease_hands_played(v.ability.extra.restore)
            ease_discard(v.ability.extra.restore)
        end
        if effect == 3 then
            v.ability.extra.mult = v.ability.extra.mult + v.ability.extra.mult_gain
            SMODS.calculate_effect({
                message = localize{type = 'variable', key = 'a_mult', vars = {v.ability.extra.mult_gain}}, 
                colour = G.C.MULT,
            }, v)
        end
    end
end

G.FUNCS.smallpox_tri_1 = function()
    triscendence(SMODS.find_card("j_smallpox_agency"), 1)
end

G.FUNCS.smallpox_tri_2 = function()
    triscendence(SMODS.find_card("j_smallpox_agency"), 2)
end

G.FUNCS.smallpox_tri_3 = function()
    triscendence(SMODS.find_card("j_smallpox_agency"), 3)
end
--#endregion