-- HUB
local player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local clientId = game:GetService("RbxAnalyticsService"):GetClientId()
-- END OF MAIN SHIT

-- Humanoid/Character
local Window = OrionLib:MakeWindow({Name = "SteakHub V1", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "SteakHub", IntroIcon = "file:///C:/Users/dfffd/Downloads/image-removebg-preview%20(14).png"})
OrionLib:MakeNotification({
	Name = "Hello!",
	Content = "Thanks for using SteakHub, join the discord by going to settings!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Tab1 = Window:MakeTab({
	Name = "Character",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab1:AddSection({
    Name = "Character"
})
Tab1:AddSlider({
	Name = "WalkSpeed",
	Min = 0,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
local playerName = player.Name
local humanoid = game.Workspace:FindFirstChild(playerName).Humanoid
humanoid.WalkSpeed = Value
		print(Value)
	end    
})
Tab1:AddSlider({
	Name = "JumpPower",
	Min = 0,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
local playerName = player.Name
local humanoid = game.Workspace:FindFirstChild(playerName).Humanoid
humanoid.JumpPower = Value
		print(Value)
	end    
})
Tab1:AddSlider({
	Name = "Health",
	Min = 0,
	Max = 100,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Health",
	Callback = function(Value)
local playerName = player.Name
local humanoid = game.Workspace:FindFirstChild(playerName).Humanoid
humanoid.Health = Value
		print(Value)
	end    
})
Tab1:AddTextbox({
	Name = "Change Headsize(X VALUE)",
	Default = "2",
	TextDisappear = true,
	Callback = function(Value)
        local playerName = player.Name
        local head = game.Workspace:FindFirstChild(playerName).Head
        	head.Size = Vector3.new(Value, head.Size.Y, head.Size.Z)
        
		print(Value)
	end	  
})
Tab1:AddTextbox({
	Name = "Change Headsize(Y VALUE)",
	Default = "1",
	TextDisappear = true,
	Callback = function(Value)
        local playerName = player.Name
        local head = game.Workspace:FindFirstChild(playerName).Head
        	head.Size = Vector3.new(head.Size.X, Value, head.Size.Z)
        
		print(Value)
	end	  
})
Tab1:AddTextbox({
	Name = "Change Headsize(Z VALUE)",
	Default = "1",
	TextDisappear = true,
	Callback = function(Value)
        local playerName = player.Name
        local head = game.Workspace:FindFirstChild(playerName).Head
        	head.Size = Vector3.new(head.Size.X, head.Size.Y, Value)
        
		print(Value)
	end	  
})
Tab1:AddButton({
	Name = "Reset Headsize",
	Callback = function()
        local playerName = player.Name
        local head = game.Workspace:FindFirstChild(playerName).Head
        head.Size = Vector3.new(2, 1, 1)
      		print("button pressed")
  	end    
})
Tab1:AddButton({
	Name = "GetClientId & Copy",
	Callback = function()
        setclipboard(game:GetService("RbxAnalyticsService"):GetClientId())
        OrionLib:MakeNotification({
            Name = "Hello!",
            Content = "Your ClientId is " ..clientId,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
  	end    
})

Tab1:AddButton({
	Name = "Fly",
	Callback = function()
        OrionLib:MakeNotification({
            Name = "Fly",
            Content = "Press E to enable and disable fly, credits to me for making this",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        
        local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local flying = false
local speed = 50
local bodyGyro, bodyVelocity

local function startFlying()
    flying = true
    
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.CFrame = humanoidRootPart.CFrame
    bodyGyro.Parent = humanoidRootPart
    bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
    bodyGyro.P = 3000
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
    bodyVelocity.Parent = humanoidRootPart
end

local function stopFlying()
    flying = false
    if bodyGyro then bodyGyro:Destroy() end
    if bodyVelocity then bodyVelocity:Destroy() end
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        if flying then
            stopFlying()
        else
            startFlying()
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if flying then
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end

        bodyVelocity.Velocity = moveDirection * speed
        bodyGyro.CFrame = camera.CFrame
    end
end)
      		print("button pressed")
  	end    
})

local Tab2 = Window:MakeTab({
	Name = "Scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab2:AddButton({
	Name = "Dex Explorer",
	Callback = function()
        OrionLib:MakeNotification({
            Name = "Dex Explorer",
            Content = "Loading DEXE, hold on a sec.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/dex.lua"))()
  	end    
})

Tab2:AddButton({
	Name = "Infinite Yield (IY)",
	Callback = function()
        OrionLib:MakeNotification({
            Name = "IY",
            Content = "Loading IY, hold on a sec.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

Tab2:AddButton({
	Name = "ESP",
	Callback = function()
        OrionLib:MakeNotification({
            Name = "ESP",
            Content = "Loading ESP, hold on a sec.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexDevlpr/Simple-ESP-using-Highlight-Roblox-/main/Minified_ver.lua"))()
    end
})
Tab2:AddButton({
	Name = "Nameless Admin",
	Callback = function()
        OrionLib:MakeNotification({
            Name = "Nameless Admin",
            Content = "Loading Nameless Admin, hold on a sec.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()

  	end    
})



OrionLib:Init()