-- credit: delovoi_chelovek007
local v1=game:GetService("Players")
local v2=game:GetService("StarterGui")
local v3=game:GetService("RunService")
local v4=game:GetService("TweenService")
local v5=game:GetService("UserInputService")
local val1=v1.LocalPlayer
local val2=val1:GetMouse()
local char1,val3,val4=nil,nil,nil
task.wait(3)
local dragFrame,val5=false,false
local delay1=0.85
local tweenInfo1=TweenInfo.new(0.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
local function addRatio(v,vv)
local ratio1=Instance.new("UIAspectRatioConstraint")
ratio1.AspectRatio=vv
ratio1.Parent=v
end
local function autoGoldFarm()
while true do
if not val3 then return end
val3.Anchored=true
if not val5 then break end
local t1=v4:Create(val3,tweenInfo1,{CFrame=CFrame.new(-57,61,275)})
t1:Play()
task.wait(delay1)
t1=v4:Create(val3,tweenInfo1,{CFrame=CFrame.new(-66,71,7913)})
t1:Play()
if not val5 then break end
t1.Completed:Wait()
val3.Anchored=false
task.wait(delay1)
t1=v4:Create(val3,tweenInfo1,{CFrame=CFrame.new(-66,-25,7913)})
t1:Play()
task.wait(18)
end
end
local gui1=Instance.new("ScreenGui")
gui1.Name="delovoi007_BAB"
gui1.ResetOnSpawn=false
gui1.IgnoreGuiInset=true
gui1.Parent=val1.PlayerGui
local frame1=Instance.new("Frame")
frame1.Size=UDim2.fromScale(0.081,0.073)
frame1.Position=UDim2.fromOffset(555,320)
frame1.AnchorPoint=Vector2.new(0.5,0.5)
frame1.BackgroundTransparency=1
frame1.Parent=gui1
local corner1=Instance.new("UICorner")
corner1.CornerRadius=UDim.new(0.3,0)
corner1.Parent=frame1
local stroke1=Instance.new("UIStroke")
stroke1.Color=Color3.fromRGB(139,195,255)
stroke1.Thickness=2
stroke1.Parent=frame1
addRatio(frame1,1.944)
local btn1=Instance.new("TextButton")
btn1.Size=UDim2.fromScale(1,1)
btn1.BackgroundColor3=Color3.fromRGB(59,68,154)
btn1.TextScaled=true
btn1.Text="Auto gold: false"
btn1.TextColor3=Color3.fromRGB(255,92,95)
btn1.Parent=frame1
local corner2=Instance.new("UICorner")
corner2.CornerRadius=UDim.new(0.3,0)
corner2.Parent=btn1
btn1.MouseButton1Click:Connect(function()
val5=not val5
btn1.Text="Auto gold: "..tostring(val5)
btn1.TextColor3=val5 and Color3.fromRGB(111,255,89)or Color3.fromRGB(255,92,95)
if val5 then task.spawn(autoGoldFarm)else if val3 then val3.Anchored=false end end
end)
btn1.InputBegan:Connect(function(inp)
if inp.UserInputType==Enum.UserInputType.MouseButton1 then dragFrame=true end
end)
v5.InputEnded:Connect(function()dragFrame=false end)
pcall(function()
v2:SetCore("SendNotification",{
Title="Build A Boat",
Text="delovoi_chelovek007 was here",
Duration=6,
Icon="http://www.roblox.com/asset/?id=72340606570838"})
end)
v3.RenderStepped:Connect(function()
char1=val1.Character
if char1 then
val3=char1:FindFirstChild("HumanoidRootPart")
val4=char1:FindFirstChild("Humanoid")
end
if dragFrame then
frame1.Position=UDim2.fromOffset(val2.X,val2.Y+65)
end
end)
