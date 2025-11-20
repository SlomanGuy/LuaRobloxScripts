local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Duration_Start_Script = 2.5
local Device = nil

local TableBrainrots = {
	"1x1x1x1",
	"67",
	"Matteo",
	"Agarrini La Palini",
	"Aquatic Index",
	"Bicicleteira Family",
	"Bisonte Giuppitere",
	"Blackhole Goat",
	"Boatito Auratito",
	"Burguro and Fryuro",
	"Burrito Bandito",
	"Capitano Moby",
	"Celularcini Viciosini",
	"Chachechi",
	"Chicleteira Bicicleteira",
	"Chicleteirina Bicicleteirina",
	"Chillin Chili",
	"Chimpanzini Spiderini",
	"Chipso and Queso",
	"Combinasions",
	"Cooki and Milki",
	"Dragon Cannelloni",
	"Dul Dul Dul",
	"Duo Brainrots",
	"Esok Sekolah",
	"Eviledon",
	"Extinct Matteo",
	"Extinct Tralalero",
	"Fragola La La La",
	"Fragrama and Chocrama",
	"Frankentteo",
	"Garama and Madundung",
	"Graipuss Medussi",
	"Guest 666",
	"Headless Horseman",
	"Horegini Boom",
	"Jackorilla",
	"Job Job Job Sahur",
	"Karker Sahur",
	"Karkerkar Kurkur",
	"Karkerkur Family",
	"Ketchuru and Musturu",
	"Ketupat Kepat",
	"La Casa Boo",
	"La Cucaracha",
	"La Extinct Grande",
	"La Grande Combinasion",
	"La Karkerkar Combinasion",
	"La Sahur Combinasion",
	"La Secret Combinasion",
	"La Spooky Grande",
	"La Supreme Combinasion",
	"La Taco Combinasion",
	"La Vacca Jacko Linterino",
	"La Vacca Saturno Saturnita",
	"Las Sis",
	"Las Tralaleritas",
	"Las Vaquitas Saturnitas",
	"Los 67",
	"Los Bros",
	"Los Chicleteiras",
	"Los Combinasionas",
	"Los Hotspotsitos",
	"Los Jobcitos",
	"Los Karkeritos",
	"Los Matteos",
	"Los Mobilis",
	"Los Nooo My Hotspotsitos",
	"Los Primos",
	"Los Spaghettis",
	"Los Spooky Combinasionas",
	"Los Spyderinis",
	"Los Tacoritas",
	"Los Tortus",
	"Los Tralaleritos",
	"Mariachi Corazoni",
	"Mieteteira Bicicleteira",
	"Money Money Puggy",
	"Noo my Candy",
	"Noo my examine",
	"Nooo My Hotspot",
	"Nuclearo Dinossauro",
	"Perrito Burrito",
	"Pirulitoita Bicicleteira",
	"Pot Hotspot",
	"Pot Pumpkin",
	"Pumpkini Spyderini",
	"Quesadilla Crocodila",
	"Quesadillo Vampiro",
	"Rang Ring Bus",
	"Sammyni Spyderini",
	"Spaghetti Tualetti",
	"Spooky and Pumpky",
	"Spooky Juggle",
	"Tacorita Bicicleta",
	"Tamaluk un Meass",
	"Tang Tang Keletang",
	"Tictac Sahur",
	"To to to Sahur",
	"Torrtuginni Dragonfrutini",
	"Tralaledon",
	"Trenostruzzo Turbo 4000",
	"Trickolino",
	"Vulturino Skeletono",
	"Yess my examine",
	"Zombie Tralala"
}


while task.wait() do
	if LocalPlayer.Character and UserInputService.TouchEnabled then
		Device = "Mobile"
		break
	else 
		Device = "PC"
		break
	end
end

task.wait(Duration_Start_Script)

local UI:ScreenGui = game:GetObjects("rbxassetid://104514587943170")[1]
UI.Parent = LocalPlayer.PlayerGui
UI.ResetOnSpawn = false

for i,v in pairs(UI:GetChildren()) do
	if v:IsA("Frame") then
		v.Visible = true
	end
end

local function Notifications()
	StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script", Text = "Player is loaded!", Duration = 2.5})
	task.delay(0.5, function()
		StarterGui:SetCore("SendNotification", {Title = "Steal a brainrot script", Text = "Created by: delovoi_chelovek007", Duration = 3.5})
	end)
end

Notifications()

local Character = LocalPlayer.Character
local Humanoid:Humanoid = Character:WaitForChild("Humanoid")

local IsJumpBoost = false
local IsDragJump_Power = false

local IsEspPlayers = false
local IsDrag_Esp_Players = false

local IsShow_Brainrots = false
local IsDrag_Show_Brainrots = false

local Default_JumpPower = Humanoid.JumpPower
local Jump_Power = 80

local BackGround_TurnON = Color3.fromRGB(67, 222, 36)
local BackGround_TurnOFF = Color3.fromRGB(255, 52, 55)

local MainJumpBoost = UI:WaitForChild("MainJumpBoost")
local MainEspPlayers = UI:WaitForChild("MainEspPlayers")
local MainShowBrainrots = UI:WaitForChild("MainShowBrainrots")

local function JumpBoost()
	local ButtonTurnJumpBoost = MainJumpBoost:WaitForChild("ButtonTurnJumpBoost")
	local LabelTurn = ButtonTurnJumpBoost:WaitForChild("TextLabel")

	ButtonTurnJumpBoost.MouseButton1Click:Connect(function()
		IsJumpBoost = not IsJumpBoost

		if IsJumpBoost then
			LabelTurn.Text = "ON"
			ButtonTurnJumpBoost.BackgroundColor3 = BackGround_TurnON
		else 
			LabelTurn.Text = "OFF"
			ButtonTurnJumpBoost.BackgroundColor3 = BackGround_TurnOFF
		end
	end)

	MainJumpBoost.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 and Device == "PC" then
			IsDragJump_Power = true
		elseif Input.UserInputType == Enum.UserInputType.Touch and Device == "Mobile" then
			IsDragJump_Power = true
		end
	end)
end


local function EspPlayers()
	local ButtonTurnEspPlayers = MainEspPlayers:WaitForChild("ButtonTurnEspPlayers")
	local LabelTurn = ButtonTurnEspPlayers:WaitForChild("TextLabel")

	ButtonTurnEspPlayers.MouseButton1Click:Connect(function()
		IsEspPlayers = not IsEspPlayers

		if IsEspPlayers then
			LabelTurn.Text = "ON"
			ButtonTurnEspPlayers.BackgroundColor3 = BackGround_TurnON
		else 
			LabelTurn.Text = "OFF"
			ButtonTurnEspPlayers.BackgroundColor3 = BackGround_TurnOFF
		end
	end)

	MainEspPlayers.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 and Device == "PC" then
			IsDrag_Esp_Players = true
		elseif Input.UserInputType == Enum.UserInputType.Touch and Device == "Mobile" then
			IsDrag_Esp_Players = true
		end
	end)
end

local function ShowBrainrots()
	local ButtonTurnShowBrainrots = MainShowBrainrots:WaitForChild("ButtonTurnShowBrainrots")
	local LabelTurn = ButtonTurnShowBrainrots:WaitForChild("TextLabel")

	ButtonTurnShowBrainrots.MouseButton1Click:Connect(function()
		IsShow_Brainrots = not IsShow_Brainrots

		if IsShow_Brainrots then
			LabelTurn.Text = "ON"
			ButtonTurnShowBrainrots.BackgroundColor3 = BackGround_TurnON

			local PlotsFolder = workspace:WaitForChild("Plots")
			if PlotsFolder then
				for indexPlot,plot in pairs(PlotsFolder:GetChildren()) do
					for indexBase, brainrot in pairs(plot:GetChildren()) do
						if brainrot:IsA("Model") and brainrot.Name ~= "Model" and brainrot.Name ~= "FriendPanel" then
							for indexbrainrot, namebrainrot in ipairs(TableBrainrots) do
								if brainrot.Name == namebrainrot then
									local BillBoardGui = Instance.new("BillboardGui")
									BillBoardGui.Name = "BillBoardUI"
									BillBoardGui.AlwaysOnTop = true
									BillBoardGui.Size = UDim2.new(10, 0,4, 0)
									BillBoardGui.ResetOnSpawn = false
									BillBoardGui.Parent = brainrot

									local TextLabel = Instance.new("TextLabel")
									TextLabel.Size = UDim2.new(1,0,1,0)
									TextLabel.BackgroundTransparency = 1
									TextLabel.TextScaled = true
									TextLabel.TextStrokeTransparency = 0
									TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
									TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
									TextLabel.Text = brainrot.Name
									TextLabel.Parent = BillBoardGui
									print("Found brainrot in table: " .. tostring(namebrainrot))
								end
							end
						end
					end
				end
			end
		else 
			LabelTurn.Text = "OFF"
			ButtonTurnShowBrainrots.BackgroundColor3 = BackGround_TurnOFF
			local PlotsFolder = workspace:WaitForChild("Plots")
			if PlotsFolder then
				for indexPlot,plot in pairs(PlotsFolder:GetChildren()) do
					for indexBase, brainrot in pairs(plot:GetChildren()) do
						if brainrot:IsA("Model") and brainrot.Name ~= "Model" and brainrot.Name ~= "FriendPanel" then
							local BillBoardGui = brainrot:FindFirstChild("BillBoardUI")
							if BillBoardGui then
								BillBoardGui:Destroy()
							end
						end
					end
				end
			end
		end
	end)

	MainShowBrainrots.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 and Device == "PC" then
			IsDrag_Show_Brainrots = true
		elseif Input.UserInputType == Enum.UserInputType.Touch and Device == "Mobile" then
			IsDrag_Show_Brainrots = true
		end
	end)
end

JumpBoost()
EspPlayers()
ShowBrainrots()

UserInputService.InputBegan:Connect(function(Input, IsTyping)
	if IsTyping then return end

	if Input.KeyCode == Enum.KeyCode.C and Device == "PC" then
		local ButtonTurnJumpBoost:TextButton = MainJumpBoost:WaitForChild("ButtonTurnJumpBoost")
		local LabelTurn:TextLabel = ButtonTurnJumpBoost:WaitForChild("TextLabel")

		IsJumpBoost = not IsJumpBoost

		if IsJumpBoost then
			LabelTurn.Text = "ON"
			ButtonTurnJumpBoost.BackgroundColor3 = BackGround_TurnON
		else 
			LabelTurn.Text = "OFF"
			ButtonTurnJumpBoost.BackgroundColor3 = BackGround_TurnOFF
		end
	end
end)

UserInputService.InputEnded:Connect(function(Input, IsTyping)
	if IsTyping then return end

	if Input.UserInputType == Enum.UserInputType.MouseButton1 and IsDragJump_Power and Device == "PC" then
		IsDragJump_Power = false
	elseif IsDragJump_Power and Device == "Mobile" then
		IsDragJump_Power = false
	elseif Input.UserInputType == Enum.UserInputType.MouseButton1 and IsDrag_Esp_Players and Device == "PC" then
		IsDrag_Esp_Players = false
	elseif IsDrag_Esp_Players and Device == "Mobile" then
		IsDrag_Esp_Players = false
	elseif Input.UserInputType == Enum.UserInputType.MouseButton1 and IsDrag_Show_Brainrots and Device == "PC" then
		IsDrag_Show_Brainrots = false
	elseif IsDrag_Show_Brainrots and Device == "Mobile" then
		IsDrag_Show_Brainrots = false
	end
end)

RunService.RenderStepped:Connect(function()
	Character = LocalPlayer.Character
	Humanoid = Character:WaitForChild("Humanoid")

	if IsJumpBoost then
		Humanoid.UseJumpPower = true
		Humanoid.JumpPower = Jump_Power
	else 
		Humanoid.UseJumpPower = false
		Humanoid.JumpPower = Default_JumpPower
	end

	if IsEspPlayers then
		for i,v in pairs(Players:GetPlayers()) do
			local Character = v.Character
			local Find_HightLight = Character:FindFirstChild("HackHightLight")


			for i,part in pairs(Character:GetChildren()) do
				if part:IsA("BasePart") and v.UserId ~= LocalPlayer.UserId then
					if part.Name == "HumanoidRootPart" or part.Name == "__HITBOX" then
						part.Transparency = 1
					else 
						part.Transparency = 0
					end
				end
			end

			if Character and not Find_HightLight and v.UserId ~= LocalPlayer.UserId then
				local HightLight = Instance.new("Highlight")
				HightLight.Name = "HackHightLight"
				HightLight.FillColor = Color3.fromRGB(255, 0, 4)
				HightLight.OutlineColor = Color3.fromRGB(255, 0, 4)
				HightLight.OutlineTransparency = 0
				HightLight.FillTransparency = 0.7
				HightLight.Parent = Character
			end
		end
	else 
		for i,v in pairs(Players:GetPlayers()) do
			local Character = v.Character
			local Find_HightLight = Character:FindFirstChild("HackHightLight")

			for i,part in pairs(Character:GetChildren()) do
				if part:IsA("BasePart") and v.UserId ~= LocalPlayer.UserId then
					if part.Name == "HumanoidRootPart" or part.Name == "__HITBOX" then
						part.Transparency = 1
					else 
						part.Transparency = 0
					end
				end
			end

			if Character and Find_HightLight then
				Find_HightLight:Destroy()
			end
		end
	end


	if IsShow_Brainrots then
		local ButtonTurnShowBrainrots = MainShowBrainrots:WaitForChild("ButtonTurnShowBrainrots")
		local LabelTurn = ButtonTurnShowBrainrots:WaitForChild("TextLabel")
		LabelTurn.Text = "ON"
		ButtonTurnShowBrainrots.BackgroundColor3 = BackGround_TurnON

		local PlotsFolder = workspace:WaitForChild("Plots")
		if PlotsFolder then
			for indexPlot,plot in pairs(PlotsFolder:GetChildren()) do
				for indexBase, brainrot in pairs(plot:GetChildren()) do
					local Find_BillBoardGui = brainrot:FindFirstChild("BillBoardUI")
					if brainrot:IsA("Model") and brainrot.Name ~= "Model" and brainrot.Name ~= "FriendPanel" and not Find_BillBoardGui then
						for indexbrainrot, namebrainrot in ipairs(TableBrainrots) do
							if brainrot.Name == namebrainrot then
								local BillBoardGui = Instance.new("BillboardGui")
								BillBoardGui.Name = "BillBoardUI"
								BillBoardGui.AlwaysOnTop = true
								BillBoardGui.Size = UDim2.new(10, 0,4, 0)
								BillBoardGui.ResetOnSpawn = false
								BillBoardGui.Parent = brainrot

								local TextLabel = Instance.new("TextLabel")
								TextLabel.Size = UDim2.new(1,0,1,0)
								TextLabel.BackgroundTransparency = 1
								TextLabel.TextScaled = true
								TextLabel.TextStrokeTransparency = 0
								TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
								TextLabel.Text = brainrot.Name
								TextLabel.Parent = BillBoardGui
								print("Found brainrot in table: " .. tostring(namebrainrot))
							end
						end
					end
				end
			end
		end
	else 
		local ButtonTurnShowBrainrots = MainShowBrainrots:WaitForChild("ButtonTurnShowBrainrots")
		local LabelTurn = ButtonTurnShowBrainrots:WaitForChild("TextLabel")
		LabelTurn.Text = "OFF"
		ButtonTurnShowBrainrots.BackgroundColor3 = BackGround_TurnOFF
		local PlotsFolder = workspace:WaitForChild("Plots")
		if PlotsFolder then
			for indexPlot,plot in pairs(PlotsFolder:GetChildren()) do
				for indexBase, brainrot in pairs(plot:GetChildren()) do
					if brainrot:IsA("Model") and brainrot.Name ~= "Model" and brainrot.Name ~= "FriendPanel" then
						local BillBoardGui = brainrot:FindFirstChild("BillBoardUI")
						if BillBoardGui then
							BillBoardGui:Destroy()
						end
					end
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if IsDragJump_Power and Device == "PC" then
			MainJumpBoost.Position = UDim2.new(0, Mouse.X - 50, 0, Mouse.Y - 23)
		else 
			if IsDragJump_Power and Device == "Mobile" then
				MainJumpBoost.Position = UDim2.new(0, Mouse.X - 25, 0, Mouse.Y - 15)
			end
		end
	end
end)

task.spawn(function()
	while task.wait() do
		if IsDrag_Esp_Players and Device == "PC" then
			MainEspPlayers.Position = UDim2.new(0, Mouse.X - 50, 0, Mouse.Y - 23)
		else 
			if IsDrag_Esp_Players and Device == "Mobile" then
				MainEspPlayers.Position = UDim2.new(0, Mouse.X - 25, 0, Mouse.Y - 15)
			end
		end
	end
end)


task.spawn(function()
	while task.wait() do
		if IsDrag_Show_Brainrots and Device == "PC" then
			MainShowBrainrots.Position = UDim2.new(0, Mouse.X - 50, 0, Mouse.Y - 23)
		else 
			if IsDrag_Show_Brainrots and Device == "Mobile" then
				MainShowBrainrots.Position = UDim2.new(0, Mouse.X - 25, 0, Mouse.Y - 15)
			end
		end
	end
end)
