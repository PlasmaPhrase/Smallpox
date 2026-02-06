

SMODS.Atlas({
    key = "missingnumber", 
    path = "jokers/MissingNumber.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "missingnumber",
    atlas = 'missingnumber',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    pools = {["Smallpox"] = true}, 
    blueprint_compat = true, 
    discovered = true,
    unlocked = true,
    config = { extra = { mult = 5 }, },
    pronouns = "they_them", 
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_glass') then

            return {
                xchips = card.ability.extra.mult
            }
        end
    end

}
