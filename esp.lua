-- thank you my idol depso 

local mybros = {}

local function highlighttheballs(p)
	local BillboardGui = Instance.new("BillboardGui")
	local Frame = Instance.new("Frame")
	local ImageLabel = Instance.new("ImageLabel")
	local ImageLabel_2 = Instance.new("ImageLabel")
	local ImageLabel_3 = Instance.new("ImageLabel")
	local ImageLabel_4 = Instance.new("ImageLabel")

	BillboardGui.Parent = game.CoreGui
	BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BillboardGui.Adornee = p.Character
	BillboardGui.AlwaysOnTop = true
	BillboardGui.LightInfluence = 1.000
	BillboardGui.Size = UDim2.new(3, 0, 5, 0)
	
	mybros[p.Name] = BillboardGui -- keep track of the guis assigned to player characters

	Frame.Parent = BillboardGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.Size = UDim2.new(1, 0, 1, 0)

	ImageLabel.Parent = Frame
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 147, 149)
	ImageLabel.BackgroundTransparency = 0.500
	ImageLabel.Size = UDim2.new(0.99966979, 0, 0.103448272, 0)
	ImageLabel.Image = "rbxassetid://2742886286" -- Remove this line if you only want colors, not a funky mario image

	ImageLabel_2.Parent = Frame
	ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 147, 149)
	ImageLabel_2.BackgroundTransparency = 0.500
	ImageLabel_2.Position = UDim2.new(0, 0, 0.109655172, 0)
	ImageLabel_2.Size = UDim2.new(0.0792602375, 0, 0.889655173, 0)
	ImageLabel_2.Image = "rbxassetid://2742886286"

	ImageLabel_3.Parent = Frame
	ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 147, 149)
	ImageLabel_3.BackgroundTransparency = 0.500
	ImageLabel_3.Position = UDim2.new(0, 0, 0.895862043, 0)
	ImageLabel_3.Size = UDim2.new(0.99966979, 0, 0.103448272, 0)
	ImageLabel_3.Image = "rbxassetid://2742886286"

	ImageLabel_4.Parent = Frame
	ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 147, 149)
	ImageLabel_4.BackgroundTransparency = 0.500
	ImageLabel_4.Position = UDim2.new(0.92040956, 0, 0.109655172, 0)
	ImageLabel_4.Size = UDim2.new(0.0792602375, 0, 0.889655173, 0)
	ImageLabel_4.Image = "rbxassetid://2742886286"
end

for _, player in pairs(game.Players:GetPlayers()) do
	if player ~= game.Players.LocalPlayer then
		pcall(function()
			highlighttheballs(player)
			player.CharacterAdded:Connect(function(caca)
				mybros[player.Name].Adornee = caca
			end)
		end)
	end
end

game.Players.PlayerAdded:Connect(function(mybossie)
	pussie.CharacterAdded:Connect(function()
		highlighttheballs(mybossie)
	end)
end)

game.Players.PlayerRemoving:Connect(function(noowhy)
	mybros[noowhy.Name]:Remove()
end)
