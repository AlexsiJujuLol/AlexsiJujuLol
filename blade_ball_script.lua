loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexsiJujuLol/Ikorz/main/blade_ball_script.local scriptURL = "https://raw.githubusercontent.com/AlexsiJujuLol/Ikorz/main/blade_ball_script.lua"

local success, result = pcall(function()
    return game:HttpGet(scriptURL, true)
end)

if success then
    print("Script fetched successfully.")
    local executeSuccess, executeResult = pcall(function()
        loadstring(result)()
    end)
    if executeSuccess then
        print("Script executed successfully.")
    else
        warn("Error executing script: " .. tostring(executeResult))
    end
else
    warn("Error fetching script: " .. tostring(result))
end
