--// Written by depso
local Players = game:GetService("Players")

local function ApplyHighlight(Player)
    local Connections = {}

    --// Parts
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local HightLighter = Instance.new("Highlight", Character)

    local function UpdateFillColor()
        local DefaultColor = Color3.fromRGB(255, 48, 51)
        HightLighter.FillColor = (Player.TeamColor and Player.TeamColor.Color) or DefaultColor
    end

    local function Disconnect()
        HightLighter:Remove()
        
        for _, Connection in next, Connections do
            Connection:Disconnect()
        end
    end

    --// Connect functions to events
    table.insert(Connections, Player:GetPropertyChangedSignal("TeamColor"):Connect(UpdateFillColor))
    table.insert(Connections, Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
        if Humanoid.Health <= 0 then
            Disconnect()
        end
    end))
end

local function HightLightPlayer(Player)
    if Player.Character then
        HightLightPlayer(Player)
    end
    Player.CharacterAdded:Connect(function()
        HightLightPlayer(Player)
    end)
end

--// Apply highlights to players
for _, Player in next, Players:GetPlayers() do
    ApplyHighlight(Player)
end
Players.PlayerAdded:Connect(ApplyHighlight)
