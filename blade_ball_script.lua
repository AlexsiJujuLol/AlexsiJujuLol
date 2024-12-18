-- Ensure the LocalPlayer and character are properly referenced
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Wait for the Humanoid and HumanoidRootPart to be available
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Example of using these references
print("Player Name: " .. player.Name)
print("Humanoid Health: " .. humanoid.Health)
print("Position: " .. tostring(humanoidRootPart.Position))

-- Load the external script
loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexsiJujuLol/AlexsiJujuLol/main/blade_ball_script.lua"))()
