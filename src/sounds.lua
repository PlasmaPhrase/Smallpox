--[[
--EXAMPLE SOUND
SMODS.Sound({
  key = "jokername_soundname", 
  path = "jokername_soundname.ext",
  volume = 0.5,
  pitch = 1,
  sync = true
}) ext can be wav, mp3, ogg
]]
SMODS.Sound({
    key="miller_laugh",
    path="miller_laugh.ogg",
    pitch=1,
    volume=0.5,
})

SMODS.Sound({
    key="miller_drain",
    path="miller_drain.ogg",
    pitch=1,
    volume=0.3,
})

SMODS.Sound({
    key = "tatsu_sfx", 
    path = "tatsu.mp3", 
})

SMODS.Sound({
    key = "poxofthewild_pop",
    path = "poxofthewild_pop.ogg",
})

SMODS.Sound({
    key = "tigerthawk_gunshot", 
    path = "tigerthawk_gunshot.wav", 
})

SMODS.Sound{
    key = "birthright_zodiac_attune",
    path = "birthright_zodiac_attune.ogg",
    volume = 1.4
}



--ripped from yahimod because it kept crashing when i was doing it 
SMODS.Sound({
    key = "music_jimbo_got_smallpox", 
    path = "JIMBO GOT SMALLPOX.mp3",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            if G.pack_cards
                and G.pack_cards.cards
                and G.pack_cards.cards[1]
                and G.pack_cards.cards[1].config
                and G.pack_cards.cards[1].config.center
                and G.pack_cards.cards[1].config.center.mod
                and G.pack_cards.cards[1].config.center.mod.id 
                and G.pack_cards.cards[1].config.center.mod.id == "smallpox" then
		        return true 
            end
        end
	end,
})
