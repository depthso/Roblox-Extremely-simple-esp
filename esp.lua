-- depso

HightLightPlayer = function(Player)
    --[[if Player.Team ~= game.Teams.Guards then
        return
    end]]
    
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local HightLighter = Instance.new("Highlight", Character)
    HightLighter.FillColor = (Player.TeamColor and Player.TeamColor.Color) or Color3.fromRGB(255, 48, 51)
    
    Humanoid.Changed:Connect(function()
        if Humanoid.Health <= 0 then
            HightLighter:Remove()
        end
    end)
end

HightLightFunc = function(Player)
    if Player.Character then
        HightLightPlayer(Player)
    end
    Player.CharacterAdded:Connect(function()
        HightLightPlayer(Player)
    end)
end

local Players = game:GetService("Players")
for _, PLayer in next, Players:GetPlayers() do
    HightLightFunc(PLayer)
end
Players.PlayerAdded:Connect(function(Player)
    HightLightFunc(Player)
end)
