-- Blade Ball Script with Fluent UI
-- Created by Ikorz

-- Load Fluent UI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Fluent/master/source.lua"))()
local window = library.new("Ikorz - Blade Ball")

-- Main Tabs and Sections
local mainTab = window:addPage("Main Features", 5012544693)
local section = mainTab:addSection("Auto Features")
local miscSection = mainTab:addSection("Misc Features")
local playerSection = mainTab:addSection("Player Info")

-- Toggles
local autoParryEnabled = false
local autoClickEnabled = false
local aiPlayEnabled = false

-- Auto Click Function
local function autoClick()
    while autoClickEnabled do
        -- Your auto-click logic here
        wait(0.1) -- Adjust the timing as needed
    end
end

-- Auto Parry Function
local function autoParry()
    while autoParryEnabled do
        -- Your auto-parry logic here
        wait(0.1) -- Adjust the timing as needed
    end
end

-- AI Play Function
local function aiPlay()
    while aiPlayEnabled do
        -- Your AI play logic here
        wait(0.1) -- Adjust the timing as needed
    end
end

-- Toggles Logic without displaying UI
autoParryEnabled = true
autoClickEnabled = true
aiPlayEnabled = true

-- Start Functions
if autoParryEnabled then
    autoParry()
end

if autoClickEnabled then
    autoClick()
end

if aiPlayEnabled then
    aiPlay()
end

-- Display Player Info (optional)
print("Player Name: " .. game.Players.LocalPlayer.Name)
