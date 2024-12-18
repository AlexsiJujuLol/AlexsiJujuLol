## Hi there 👋

<!--
**AlexsiJujuLol/AlexsiJujuLol** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->-- Load the external script
loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexsiJujuLol/Ikorz/main/blade_ball_script.lua"))()

-- Auto Parry Function
local function autoParry()
    for _, ball in pairs(workspace:GetChildren()) do
        if ball.Name == "BladeBall" and ball:FindFirstChild("Owner") and ball.Owner.Value ~= game.Players.LocalPlayer then
            local ballPosition = ball.Position
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ballPosition).magnitude

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

-- Auto Play Function
local function autoPlay()
    -- Add your auto play logic here
end

-- Anti Lag Function
local function antiLag()
    -- Add your anti lag logic here
end

-- Auto Spam Function
local function autoSpam()
    -- Add your auto spam logic here
end

-- Auto Click Function
local function autoClick()
    -- Add your auto click logic here
end

-- Run the Features
spawn(function()
    while task.wait(0.1) do
        autoParry()
        autoPlay()
        antiLag()
        autoSpam()
        autoClick()
    end
end)

