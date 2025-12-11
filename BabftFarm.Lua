-- Credit delovoi_chelovek007

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local Character:Model = nil
local Humanoid:Humanoid = nil
local Hrp:BasePart = nil

local Second_Tween = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

task.wait(2.5)

local Auto_Farm_Gold = false
local Timer_Next_Cycle = 0.01

local Name_Folder = "Part_AutoFarm15151515151"

local Folder = Instance.new("Folder")
Folder.Name = Name_Folder

Folder.Parent = workspace

local function Create_Parts()
	for i = 1,10 do
		local Part = Instance.new("Part")
		Part.Name = "Part" .. tostring(i)
		
		Part.Size = Vector3.new(6, 1, 6)
		Part.BrickColor = BrickColor.Gray()
		
		Part.Anchored = true
		Part.CanCollide = true
		
		Part.Parent = Folder
		
		if Part.Name == "Part1" then	
			Part.CFrame = CFrame.new(-65.79,78.29,312.99)
		elseif Part.Name == "Part2" then
			Part.CFrame = CFrame.new(-49.191,78.292,1712.901)
		elseif Part.Name == "Part3" then
			Part.CFrame = CFrame.new(-39.702,78.292,2512.845)
		elseif Part.Name == "Part4" then
			Part.CFrame = CFrame.new(-31.102,78.292,3237.795)
		elseif Part.Name == "Part5" then
			Part.CFrame = CFrame.new(-21.317,78.292,4062.739)
		elseif Part.Name == "Part6" then
			Part.CFrame = CFrame.new(-62.393,78.292,4811.281)
		elseif Part.Name == "Part7" then
			Part.CFrame = CFrame.new(-42.895,78.292,5611.047)
		elseif Part.Name == "Part8" then
			Part.CFrame = CFrame.new(-25.225,78.292,6335.834)
		elseif Part.Name == "Part9" then
			Part.CFrame = CFrame.new(-56.258,78.292,7113.219)
		elseif Part.Name == "Part10" then
			Part.CFrame = CFrame.new(-42.806,78.292,7888.098)
		end
	end
end

local function Delete_Parts()
	if Folder and #Folder:GetChildren() >= 1 then
		Folder:ClearAllChildren()
	end
end

pcall(function()
	Character = LocalPlayer.Character
	Humanoid = Character:FindFirstChild("Humanoid")
	Hrp = Character:FindFirstChild("HumanoidRootPart")
	
	StarterGui:SetCore("SendNotification", {Title = "Babft", Text = "Press to P active auto farm!", Duration = 4.5})
	
	task.delay(0.5, function()
		StarterGui:SetCore("SendNotification", {Title = "Babft", Text = "Credit: delovoi_chelovek007", Duration = 3})
	end)
end)

UserInputService.InputBegan:Connect(function(Input, IsTyping)
	if IsTyping then return end
	
	if Input.KeyCode == Enum.KeyCode.P then
		Auto_Farm_Gold = not Auto_Farm_Gold
		
		if Auto_Farm_Gold then
			Create_Parts()
			StarterGui:SetCore("SendNotification", {Title = "Babft", Text = "Auto farm Turn ON!", Duration = 0.5})
		else 
			Delete_Parts()
			StarterGui:SetCore("SendNotification", {Title = "Babft", Text = "Auto farm Turn OFF!", Duration = 0.5})
		end
	end
end)

task.spawn(function()
	while true do
		if Auto_Farm_Gold then
			Timer_Next_Cycle = 18.5
			
			for i,v in ipairs(Folder:GetChildren()) do
				if v:IsA("BasePart") and Hrp then
					Hrp.CFrame = v.CFrame
				end
				
				task.wait(1)
			end
			
			task.delay(0.5, function()
				if Hrp then
					print("Hrp tween!!")
					local Tween_Down = TweenService:Create(Hrp, Second_Tween, {CFrame = CFrame.new(-42.806,-1000,7888.098)})
					Tween_Down:Play()
				else
					local Torso = Character:FindFirstChild("UpperTorso")
					
					local Tween_Down = TweenService:Create(Torso, Second_Tween, {CFrame = CFrame.new(-42.806,-1000,7888.098)})
					Tween_Down:Play()
				end
			end)
		else 
			Timer_Next_Cycle = 0.01
		end
		
		task.wait(Timer_Next_Cycle)
	end
end)

RunService.RenderStepped:Connect(function()
	Character = LocalPlayer.Character
	Humanoid = Character:WaitForChild("Humanoid")
	Hrp = Character:WaitForChild("HumanoidRootPart")
end)
