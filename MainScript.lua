local lib = Instance.new("ScreenGui")
local main = Instance.new("Folder")
local anims = Instance.new("Folder")
local base = Instance.new("Frame")
local name = Instance.new("TextLabel")
local line = Instance.new("Frame")

lib.Name = "lib"
lib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
lib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = lib

anims.Name = "anims"
anims.Parent = main

base.Name = "base"
base.Parent = lib
base.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
base.Position = UDim2.new(0.328348875, 0, 0.157107234, 0)
base.Size = UDim2.new(0, 550, 0, 0)

name.Name = "name"
name.Parent = base
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BackgroundTransparency = 1.000
name.Size = UDim2.new(0, 79, 0, 27)
name.Font = Enum.Font.Michroma
name.Text = "CRENO"
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextSize = 19.000
name.TextTransparency = 1.000

line.Name = "line"
line.Parent = base
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BorderSizePixel = 0
line.Position = UDim2.new(-0.00181818183, 0, 0.0454545468, 0)
line.Size = UDim2.new(0, 0, 0, 2)

-- Module Scripts:

local fake_module_scripts = {}

do -- nil.close
	local script = Instance.new('ModuleScript', nil)
	script.Name = "close"
	local function module_script()
		local f, t = false, true
		local tweenservice = game:GetService('TweenService')
		local info, ease, direct = TweenInfo, Enum.EasingStyle, Enum.EasingDirection
		local sgui = game:GetService('StarterGui')
		local screengui = sgui:FindFirstChild('lib')
		local base = screengui.base
		local objects = {base, base.name, base.line}
		
		local module = {}
		
		function module()
			if screengui then
				if objects[1].Size == UDim2.new(0, 550, 0, 550) and objects[2].TextTransparency == 0 then
					local tween2 = tweenservice:Create(objects[1], info.new(0.86, ease.Quart, direct.InOut, 0, f, 0), {Size = UDim2.new(0, 550, 0, 0)})
					local tween1 = tweenservice:Create(objects[2], info.new(0.48, ease.Quart, direct.InOut, 0, f, 0), {TextTransparency = 1})
					tween1:Play()
					wait(0.36)
					tween2:Play()
				end
			end		
		end
		
		return module
	end
	fake_module_scripts[script] = module_script
end
do -- nil.open
	local script = Instance.new('ModuleScript', nil)
	script.Name = "open"
	local function module_script()
		local f, t = false, true
		local tweenservice = game:GetService('TweenService')
		local info, ease, direct = TweenInfo, Enum.EasingStyle, Enum.EasingDirection
		local sgui = game:GetService('StarterGui')
		local screengui = sgui:FindFirstChild('lib')
		local base = screengui.base
		local objects = {base, base.name, base.line}
		
		local module = {}
		
		function module()
			if screengui then
				if objects[1].Size == UDim2.new(0, 550, 0, 0) and objects[2].TextTransparency == 1 then
					local tween1 = tweenservice:Create(objects[1], info.new(0.86, ease.Quart, direct.InOut, 0, f, 0), {Size = UDim2.new(0, 550, 0, 550)})
					local tween2 = tweenservice:Create(objects[2], info.new(0.48, ease.Quart, direct.InOut, 0, f, 0), {TextTransparency = 0})
					tween1:Play()
					wait(0.76)
					tween2:Play()
				end
			end
		end
		
		return module
	end
	fake_module_scripts[script] = module_script
end


-- Scripts:

local function GQAPO_fake_script() -- anims.ui 
	local script = Instance.new('LocalScript', anims)
	local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

	--// IGNORE
	
	local sgui = game:GetService('StarterGui')
	
	--// Starter Sizes
	
	local screengui = sgui.lib
	local base = screengui.base
	local objects = {base, base.name, base.line}
	
	objects[1].Size = UDim2.new(0, 550, 0, 0)
	objects[2].TextTransparency = 1
	objects[3].Size = UDim2.new(0, 0, 0, 2)
	
	--// Modules
	
	local animModules = {
		
		['openUI'] = require(script.open), 
		['closeUI'] = require(script.close)
		
	}
	
	--// BoolValues
	
	local f, t = false, true
	
	--// Values
	
	local mainUIisOpen = f
	local canHover = f
	
	--// Player Stuff
	
	local plr = game:GetService('Players').LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	local hrp = char:WaitForChild('HumanoidRootPart')
	
	-- // Main
	
	local kcode = Enum.KeyCode
	local usp = game:GetService('UserInputService')
	
	usp.InputBegan:Connect(function(input, gpe)
		if gpe then return end
		if input.KeyCode == kcode.LeftControl and mainUIisOpen == f then
			mainUIisOpen = t
			canHover = t
			animModules.openUI()
		elseif input.KeyCode == kcode.LeftControl and mainUIisOpen == t then
			mainUIisOpen = f
			canHover = f
			animModules.closeUI()
		end
	end)
end
coroutine.wrap(GQAPO_fake_script)()
