-- Load the Blox Fruits Script
loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexsiOrIkorz/BloxFruitsScript/main/blox_fruits_script.lua"))()

-- Your existing script content
-- Blox Fruits Script with Fluent UI
-- Created by Ikorz

-- Load Fluent UI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Fluent/master/source.lua"))()
local window = library.new("Ikorz - Blox Fruits")

-- Create Tabs and Sections
local mainTab = window:addPage("Main Features", 5012544693)
local farmingSection = mainTab:addSection("Farming Features")
local raidSection = mainTab:addSection("Raiding Features")
local seaSection = mainTab:addSection("Sea Navigation")
local miscSection = mainTab:addSection("Misc Features")

-- Toggle States
local autoFarmEnabled = false
local autoFarmChestEnabled = false
local autoRaidEnabled = false
local autoSea1Enabled = false
local autoSea2Enabled = false
local autoSea3Enabled = false
local autoBountyEnabled = false
local autoFactoryEnabled = false

-- Farming Toggles
farmingSection:addToggle("Auto Farm", nil, function(state)
    autoFarmEnabled = state
end)

farmingSection:addToggle("Auto Farm Chest Fast", nil, function(state)
    autoFarmChestEnabled = state
end)

-- Raid Toggles
raidSection:addToggle("Auto Raid", nil, function(state)
    autoRaidEnabled = state
end)

-- Sea Navigation Toggles
seaSection:addToggle("Auto Sea 1", nil, function(state)
    autoSea1Enabled = state
end)

seaSection:addToggle("Auto Sea 2", nil, function(state)
    autoSea2Enabled = state
end)

seaSection:addToggle("Auto Sea 3", nil, function(state)
    autoSea3Enabled = state
end)

-- Misc Toggles
miscSection:addToggle("Auto Bounty", nil, function(state)
    autoBountyEnabled = state
end)

miscSection:addToggle("Auto Factory", nil, function(state)
    autoFactoryEnabled = state
end)

-- Variables and Player Information
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)

if not humanoidRootPart then
    warn("HumanoidRootPart not found!")
    return
end

-- Farming Function
local function autoFarm()
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
            task.wait(0.1)
            game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0))
        end
    end
end

-- Auto Raid Function
local function autoRaid()
    -- Add raid logic here
    print("Auto Raid triggered!")
end

-- Sea Navigation Function
local function navigateSea(seaNumber)
    print("Navigating to Sea " .. seaNumber)
    -- Add sea navigation logic here
end

-- Main Loop
spawn(function()
    while task.wait(0.1) do
        if autoFarmEnabled then
            autoFarm()
        end

        if autoFarmChestEnabled then
            -- Add chest farming logic here
        end

        if autoRaidEnabled then
            autoRaid()
        end

        if autoSea1Enabled then
            navigateSea(1)
        end

        if autoSea2Enabled then
            navigateSea(2)
        end

        if autoSea3Enabled then
            navigateSea(3)
        end

        if autoBountyEnabled then
            -- Add bounty farming logic here
        end

        if autoFactoryEnabled then
            -- Add factory farming logic here
        end
    end
end)

-- Show the UI
library:format(window)
