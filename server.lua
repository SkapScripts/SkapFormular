RegisterServerEvent("skapformular:logForm", function(formId, title, input)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local name = Player and Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname or "Okänd"
    local steam = Player and Player.PlayerData.steam or "N/A"
    local discord = Player and Player.PlayerData.discord or "N/A"
    local identifier = Player and Player.PlayerData.citizenid or "N/A"

    local fields = {}
    for i, v in ipairs(input) do
        table.insert(fields, {
            name = "Answer " .. i,
            value = v ~= "" and v or "*No answer*",
            inline = false
        })
    end

    local webhook = nil
    for _, ped in pairs(Config.Peds) do
        for _, form in pairs(ped.forms) do
            if form.id == formId then
                webhook = ped.webhook
                break
            end
        end
        if webhook then break end
    end

    if not webhook then return end

    local embed = {
        {
            title = "📝 New Forumlar sent",
            description = "**Type:** " .. title,
            color = 5763719,
            fields = fields,
            footer = {
                text = "Sent by : " .. name .. " | CID: " .. identifier,
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 then
            print("❌ Failed to send to discord. Code: " .. tostring(err))
        end
    end, "POST", json.encode({
        username = "Forumlar System:",
        embeds = embed
    }), {["Content-Type"] = "application/json"})
end)
