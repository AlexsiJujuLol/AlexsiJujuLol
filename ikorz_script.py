-- Blade Ball Script with Fluent UI
-- Created by Ikorz

-- Load Fluent UI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Fluent/master/source.lua"))()
local window = library.new("Ikorz - Blade Ball")

-- Main Tab and Features Section
local mainTab = window:addPage("Main Features", 5012544693)
local section = mainTab:addSection("Auto Features")

-- Toggles for Features
local autoParryEnabled = false
local autoDodgeEnabled = false

section:addToggle("Auto Parry", nil, function(state)
    autoParryEnabled = state
end)

section:addToggle("Auto Dodge", nil, function(state)
    autoDodgeEnabled = state
end)

-- Variables and Player Info
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

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
                humanoidRoot
