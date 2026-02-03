-- Example Joker
SMODS.Joker {
    key = "examplejoker",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { mult = 5 }, },
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Joker {
    key = "blackjack",
    blueprint_compat = true,
    rarity = 3,
    cost = 4,
    atlas = "CustomJokers",
    pos = { x = 3, y = 1 },

    config = { extra = { min = 4, max = 20, moneymin = 1, moneymax = 20, mult_n = 1, mult_d = 2, X_n = 1, X_d = 2} }, --kept throwing errors when i tried to uses mult_n and mult_d directly and X_n and X_d so idk

    loc_txt = {
        name = "Blackjack",
        text = { "" }
    },

    loc_vars = function(self, info_queue, card)

        local r_mults = {}
        for i = math.floor(card.ability.extra.min), math.floor(card.ability.extra.max) do
            r_mults[#r_mults + 1] = tostring(i)
        end

        local main_end = {

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {"X", "+"},
                        colours = { G.C.MULT },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = r_mults,
                        colours = { G.C.MULT },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {" Mult", " Chips"},
                        colours = { G.C.DARK_EDITION },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.T,
                config = {
                    text = " and ",
                    colour = G.C.UI.TEXT_DARK,
                    scale = 0.32
                }
            },

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = r_mults,
                        colours = { G.C.MONEY },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.T,
                config = {
                    text = "$",
                    colour = G.C.MONEY,
                    scale = 0.32
                }
            },
        }

        return { main_end = main_end }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.full_hand then
            local faces = 0
            local aces = 0
            local numbers = 0

            for _, c in ipairs(context.full_hand) do
                if c:get_id() == 11 or c:get_id() == 12 or c:get_id() == 13 or c:get_id() == 10 then
                    faces = faces + 1
                end
                if c:get_id() == 14 then
                    aces = aces + 1
                end
                if c:get_id() < 10 then
                    numbers = numbers + 1
                end
            end

            -- this whole block is so overcomplicated lmao i could do this way better but nested ifs it is
            if faces == 1 and aces == 1 and numbers == 0 then
                if SMODS.pseudorandom_probability(card, "black_spot", 1, 2) then
                    if SMODS.pseudorandom_probability(card, "X_prob", 1, 2) then
                        return {
                            Xmult = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.MULT
                        }
                    else
                        return {
                            mult = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.MULT
                        }
                    end
                else 
                    if SMODS.pseudorandom_probability(card, "X_prob", 1, 2) then
                        return {
                            xchips = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.CHIPS
                        }
                    else
                        return {
                            chips = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.CHIPS
                        }
                    end
                end
            end
        end
    end
    
}
