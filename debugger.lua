if game.CoreGui:FindFirstChild("Debugger") then
	game.CoreGui.Debugger:Destroy()
end

debugger = {
	createUI = function()
		local Debugger = Instance.new("ScreenGui", game.CoreGui)
		local Frame = Instance.new("Frame", Debugger)
		local UIListLayout = Instance.new("UIListLayout", Frame)

		Debugger.Name = "Debugger"
		Debugger.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		Frame.AnchorPoint = Vector2.new(0, 1)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 0.500
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.82426405, 0, 1, 0)
		Frame.Size = UDim2.new(0, 197, 0, 0)
		Frame.AutomaticSize = Enum.AutomaticSize.Y

		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	end,
	
	update = function(label, text)
		if not game.CoreGui.Debugger.Frame:FindFirstChild(label) then
			local TextLabel = Instance.new("TextLabel", game.CoreGui.Debugger.Frame)
			TextLabel.Name = label
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(1, 0, 0, 15)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = "State: false"
			TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
		end
		
		game.CoreGui.Debugger.Frame[label].Text = text
	end,
	
	clear = function()
		for i,v in pairs(game.CoreGui.Debugger.Frame:GetChildren()) do
			if v:IsA("TextLabel") then
				debugger.update(v.Name, "no info")
			end
		end
	end,
} 

return debugger
