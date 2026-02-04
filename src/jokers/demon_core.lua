-- Example Joker Atlas
SMODS.Atlas({
	key = "demon_core",
	path = "jokers/demon_core.png",
	px = 71,
	py = 95,
	atlas_table = "ASSET_ATLAS",
})

-- Example Joker
SMODS.Joker({
	key = "demon_core",
	pos = { x = 0, y = 0 },
	rarity = 2,
	blueprint_compat = true,
	cost = 6,
	discovered = true,
	config = { extra = { xmult = 1, xmult_gain = 0.5, spectral_used = false } },
	atlas = "demon_core",

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult, } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
        if context.setting_blind then
            SMODS.scale_card(card, {
                ref_value = "xmult",
                scalar_value = "xmult_gain"
            })
        end
		if context.using_consumeable and context.consumeable.ability.set == "Spectral" then
			card.ability.extra.spectral_used = true
		end
		if
			context.end_of_round
			and context.main_eval
			and not context.game_over
			and not context.blueprint
			and context.beat_boss
		then
			if not card.ability.extra.spectral_used then
                local pool = {}
                for _, c in ipairs(G.jokers.cards) do
                    if c ~= card then
                        pool[#pool+1] = c
                    end
                end
				local target = pseudorandom_element(pool)
                if target then
                    SMODS.debuff_card(target, true, "smallpox_demon_core")
                end
			else
				card.ability.extra.spectral_used = false
			end
		end
	end,
})
