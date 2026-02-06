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

SMODS.Sound{
    key="laugh",
    path="devil3.ogg",
    pitch=1,
    volume=0.5,
}

SMODS.Sound{ --Do NOT increase the volume, the sound in of itself is already way to loud
    key="drain",
    path="drain.ogg",
    pitch=1,
    volume=0.3,
}
