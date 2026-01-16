local _0x1 = game
local _0x2 = _0x1.GetService
local _0x3 = _0x2(_0x1,"Players")
local _0x4 = _0x2(_0x1,"StarterGui")
local _0x5 = _0x2(_0x1,"RunService")
local _0x6 = _0x2(_0x1,"UserInputService")

local _0x7 = _0x3.LocalPlayer
local _0x8 = _0x7:GetMouse()

local function _0xF()
	return _0x7.Character or _0x7.CharacterAdded:Wait()
end

local _0x9 = _0xF()
local _0xA = _0x9:FindFirstChild("Humanoid")
local _0xB = _0x9:FindFirstChild("HumanoidRootPart")

local _0xC = game:GetObjects(("rbxassetid://"..118171760564865))[1]
_0xC.Parent = _0x7:WaitForChild("PlayerGui")

local _0xD = _0xC:WaitForChild("Main")
local _0xE = _0xD:WaitForChild("MainDrag")
local _0x10 = _0xE:WaitForChild("HitBoxDrag")

local _0x11 = _0xE:WaitForChild("TextButton")
local _0x12 = _0xD:WaitForChild("ButtonSpeedBoost")
local _0x13 = _0xD:WaitForChild("ButtonJumpBoost")

local _0x14 = _0x11:WaitForChild("ImageLabel")

_D = true
_0xD.Visible = _D

local _0x15 = false
local _0x16 = false
local _0x17 = false

local _0x18 = 29.5
local _0x19 = 80

local _0x1A = Color3.fromRGB(51,137,218)
local _0x1B = Color3.fromRGB(47,124,200)

local _0x1C = "http://www.roblox.com/asset/?id=12072054746"
local _0x1D = "http://www.roblox.com/asset/?id=11622919444"

_0x14.Image = _0x1D

_0x12.MouseButton1Click:Connect(function()
	_0x15 = not _0x15
	_0x12.Text = "Speed Boost: "..(_0x15 and "ON" or "OFF")
	_0x12.BackgroundColor3 = _0x15 and _0x1A or _0x1B
end)

_0x13.MouseButton1Click:Connect(function()
	JumpBoost = not JumpBoost
	_0x13.Text = "Jump Boost: "..(JumpBoost and "ON" or "OFF")
	_0x13.BackgroundColor3 = JumpBoost and _0x1A or _0x1B
end)

_0x11.MouseButton1Click:Connect(function()
	local _t = (_0xD.Transparency == 0)
	_0xD.Transparency = _t and 1 or 0
	_0x12.Visible = not _t
	_0x13.Visible = not _t
	_0x14.Image = _t and _0x1C or _0x1D
end)

_0x10.InputBegan:Connect(function(i)
	if (i.UserInputType == Enum.UserInputType.MouseButton1 and _0x6.KeyboardEnabled)
	or (i.UserInputType == Enum.UserInputType.Touch and _0x6.KeyboardEnabled) then
		_0x17 = true
	end
end)

_0x6.InputEnded:Connect(function(i)
	if (i.UserInputType == Enum.UserInputType.MouseButton1 and _0x6.KeyboardEnabled)
	or (i.UserInputType == Enum.UserInputType.Touch and _0x6.TouchEnabled) then
		_0x17 = false
	end
end)

_0x5.RenderStepped:Connect(function()
	_0x9 = _0xF()
	_0xA = _0x9:FindFirstChild("Humanoid")
	_0xB = _0x9:WaitForChild("HumanoidRootPart")

	if _0x17 then
		_0xD.Position = UDim2.fromOffset(_0x8.X - 100,_0x8.Y - 20)
	end

	if JumpBoost and _0xA then
		_0xA.UseJumpPower = true
		_0xA.JumpHeight = _0x19
		_0xA.JumpPower = _0x19
	else
		_0xA.UseJumpPower = false
	end

	if _0x15 and _0xB and _0xA then
		_0xB.AssemblyLinearVelocity = _0xA.MoveDirection * _0x18
	end
end)
