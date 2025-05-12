local function openFormMenu(pedData)
    local options = {}

    for _, form in ipairs(pedData.forms) do
        table.insert(options, {
            title = form.label,
            icon = "📝",
            onSelect = function()
                local input = lib.inputDialog(form.label, form.questions)
                if input then
                    lib.notify({
                        title = "Formular",
                        description = form.label .. " Sent!",
                        type = "success"
                    })

                    TriggerServerEvent("skapformular:logForm", form.id, form.label, input) -- KORREKT ORDNING
                end
            end
        })
    end

    lib.registerContext({
        id = "form_menu_" .. pedData.job,
        title = pedData.label,
        options = options
    })

    lib.showContext("form_menu_" .. pedData.job)
end

CreateThread(function()
    for _, pedData in pairs(Config.Peds) do
        RequestModel(pedData.model)
        while not HasModelLoaded(pedData.model) do
            Wait(0)
        end

        local ped = CreatePed(0, pedData.model, pedData.coords.x, pedData.coords.y, pedData.coords.z - 1.0, pedData.coords.w, false, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    label = pedData.targetLabel or "Open Formular",
                    icon = "fas fa-file-alt",
                    action = function()
                        openFormMenu(pedData)
                    end
                }
            },
            distance = 2.5
        })
    end
end)
