local x1 = game
local x2 = x1:GetService("Players")
local x3 = x1:GetService("StarterGui")
local x4 = x1:GetService("RunService")
local x5 = x1:GetService("UserInputService")

local x6 = x2.LocalPlayer
local x7 = x6:GetMouse()

local function x8()
	return x6.Character or x6.CharacterAdded:Wait()
end

local x9 = x8()
local xA = x9:FindFirstChild("Humanoid")
local xB = x9:FindFirstChild("HumanoidRootPart")

local xC = x1:GetObjects("rbxassetid://118171760564865")[1]
xC.Parent = x6.PlayerGui

local xD = xC:WaitForChild("Main")
local xE = xD:WaitForChild("MainDrag")
local xF = xE:WaitForChild("HitBoxDrag")

local xG = xE:WaitForChild("TextButton")
local xH = xD:WaitForChild("ButtonSpeedBoost")
local xI = xD:WaitForChild("ButtonJumpBoost")

local xJ = xG:WaitForChild("ImageLabel")

xD.Visible = true

local xK = false
local xL = false
local xM = false

local xN = 29.8
local xO = 80

local xP = Color3.fromRGB(51,137,218)
local xQ = Color3.fromRGB(47,124,200)

local xR = "http://www.roblox.com/asset/?id=12072054746"
local xS = "http://www.roblox.com/asset/?id=11622919444"

xJ.Image = xS

xH.MouseButton1Click:Connect(function()
	xK = not xK
	xH.Text = "Speed Boost: " .. (xK and "ON" or "OFF")
	xH.BackgroundColor3 = xK and xP or xQ
end)

xI.MouseButton1Click:Connect(function()
	xL = not xL
	xI.Text = "Jump Boost: " .. (xL and "ON" or "OFF")
	xI.BackgroundColor3 = xL and xP or xQ
end)

xG.MouseButton1Click:Connect(function()
	local z = xD.Transparency == 0
	xD.Transparency = z and 1 or 0
	xH.Visible = not z
	xI.Visible = not z
	xJ.Image = z and xR or xS
end)

xF.InputBegan:Connect(function(i)
	if (i.UserInputType == Enum.UserInputType.MouseButton1
	or i.UserInputType == Enum.UserInputType.Touch)
	and x5.KeyboardEnabled then
		xM = true
	end
end)

x5.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1
	or i.UserInputType == Enum.UserInputType.Touch then
		xM = false
	end
end)

x4.RenderStepped:Connect(function()
	x9 = x8()
	xA = x9:FindFirstChild("Humanoid")
	xB = x9:WaitForChild("HumanoidRootPart")

	if xM then
		xD.Position = UDim2.fromOffset(x7.X - 100, x7.Y - 20)
	end

	if xL and xA then
		xA.UseJumpPower = true
		xA.JumpPower = xO
		xA.JumpHeight = xO
	else
		xA.UseJumpPower = false
	end

	if xK and xB and xA then
		xB.AssemblyLinearVelocity = xA.MoveDirection * xN
	end
end)

-- my discord: serpol39
