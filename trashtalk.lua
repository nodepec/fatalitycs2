local messages = {
    "1 nn doggy sit",
    "sit doggy",
    "SLAMMMMMED",
    "free merdia lil vro",
    "your going in the next montage lil vro",
    "bot_kick",
    "iq?",
    "i know my fembussy looks good but you need to focus",
    "LIFEHAAACK BITCH (◣_◢)",
}

local function getRandomMessage()
    return messages[math.random(1, #messages)]
end

local function onEvent(event)
    if event:get_name() == "player_death" then
        local attacker = event:get_pawn_from_id("attacker")
        if attacker and attacker:get_name() == entities.get_local_pawn():get_name() then
            local randomMessage = getRandomMessage()
            game.engine:client_cmd('say ' .. randomMessage)
        end
    end
end

mods.events:add_listener("player_death")
events.event:add(onEvent)