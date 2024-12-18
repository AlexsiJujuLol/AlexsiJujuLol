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

-- Feature Toggles
local autoParryEnabled = false
local autoDodgeEnabled = false
local antiLagEnabled = false
local spamBoostEnabled = false
local spamDelay = 0.1

-- Toggles for Auto Features
section:addToggle("Auto Parry", nil, function(state)
    autoParryEnabled = state
end)

section:addToggle("Auto Dodge", nil, function(state)
    autoDodgeEnabled = state
end)

-- Miscellaneous Toggles
miscSection:addToggle("Anti Lag", nil, function(state)
    antiLagEnabled = state
end)

miscSection:addToggle("Spam Boost", nil, function(state)
    spamBoostEnabled = state
end)

miscSection:addSlider("Spam Delay", 0.1, 0.1, 5, function(value)
    spamDelay = value
end)

-- Player Info Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Display Player Info
playerSection:addLabel("Player Name: " .. player.Name)
playerSection:addLabel("Health: " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth))
playerSection:addLabel("WalkSpeed: " .. humanoid.WalkSpeed)

playerSection:addButton("Reset Character", function()
    humanoid.Health = 0
end)

playerSection:addSlider("Set WalkSpeed", humanoid.WalkSpeed, 16, 100, function(value)
    humanoid.WalkSpeed = value
end)

playerSection:addSlider("Set JumpPower", humanoid.JumpPower, 50, 200, function(value)
    humanoid.JumpPower = value
end)

-- Auto Parry Function
local function autoParry()
    for _, ball in pairs(workspace:GetChildren()) do
        if ball.Name == "BladeBall" and ball:FindFirstChild("Owner") and ball.Owner.Value ~= player then
            local ballPosition = ball.Position
            local distance = (humanoidRootPart.Position - ballPosition).magnitude

            if distance <= 10 then -- Adjust range for parry
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
                task.wait(0.1)
                game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0))
                print("Parry triggered!")
            end
        end
    end
end

-- Auto Dodge Function
local function autoDodge()
    for _, ball in pairs(workspace:GetChildren()) do
        if ball.Name == "BladeBall" and ball:FindFirstChild("Owner") and ball.Owner.Value ~= player then
            local ballPosition = ball.Position
            local distance = (humanoidRootPart.Position - ballPosition).magnitude

            if distance <= 5 then -- Adjust range for dodge
                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(10, 0, 0)
                print("Dodged!")
            end
        end
    end
end

-- Anti Lag Function
local function antiLag()
    while antiLagEnabled do
        task.wait(0.1)
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.CanCollide then
                obj.CanCollide = false
            end
        end
    end
end

-- Spam Boost Function
local function spamBoost()
    while spamBoostEnabled do
        task.wait(spamDelay)
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
        task.wait(0.1)
        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0))
        print("Boost Spammed!")
    end
end

-- Run Functions Based on Toggles
spawn(function()
    while task.wait(0.1) do
        if autoParryEnabled then autoParry() end
        if autoDodgeEnabled then autoDodge() end
    end
end)

spawn(function()
    antiLag()
end)

spawn(function()
    spamBoost()
end)

-- Show the UI
library:format(window)
