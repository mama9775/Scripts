local KeySystem = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = KeySystem:MakeWindow({Name = "Fadp Keysystem", HidePremium = true, SaveConfig = false, ConfigFolder = "Fadp-Key"})

local Tab = Window:MakeTab({
    Name = "KeySystem"
})
local KeySection = Tab:AddSection({
    Name = "Key Section"
})

local attempts = 0
local maxAttempts = 3
local HttpService = game:GetService("HttpService")
local hwid = game:GetService("Players").LocalPlayer.UserId

Tab:AddTextbox({
    Name = "Key?",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        local valid = "keyy"
        if value == valid then
            KeySystem:MakeNotification({
                Name = "Right Key!",
                Content = "Wohooo lets load your ScriptHub",
                Time = 10
            })
            wait(1)
            LoadOrionLib()
        else
            attempts = attempts + 1
            if attempts >= maxAttempts then
                
                KeySystem:MakeNotification({
                    Name = "HWID Banned!",
                    Content = "You have been banned from the ScriptHub for: " .. maxAttempts .. " maxed attempts" ,
                    Time = 10
                })
                wait(2)
                KeySystem:MakeNotification({
                    Name = "HWID Banned!",
                    Content = "HWID which got Banned " .. hwid,
                    Time = 10
                })
                wait(5)
                KeySystem:Destroy()
            else
                KeySystem:MakeNotification({
                    Name = "Wrong Key!",
                    Content = "Get the Right key or you will be HWID banned after " .. (maxAttempts - attempts) .. " more attempts.",
                    Time = 10
                })
            end
        end
    end	  
})

-- OrionLib
function LoadOrionLib()
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Fadp", HidePremium = false, SaveConfig = true, ConfigFolder = "Fadp"})

    local MainTab = Window:MakeTab({
        Name = "Main"
    })
    local LocalTab = Window:MakeTab({
        Name = "LocalPlayer"
    })
    local EspTab = Window:MakeTab({
        Name = "Esp"
    })

    local MainSection = MainTab:AddSection({
        Name = "Main-Section"
    })
    local LocalSection = LocalTab:AddSection ({
        Name = "Local-Section"
    })
    local EspSection = EspTab:AddSection({
        Name = "Esp-Section"
    })

    OrionLib:MakeNotification({
        Name = "Have Fun!",
        Content = "Fadp loaded successfully!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    MainTab:AddToggle({
        Name = "Auto Collect!",
        Default = false,
        Callback = function(value)
            if value then
                OrionLib:MakeNotification({
                    Name = "Toggled On!",
                    Content = "",
                    Time = 5
                })
                wait(2)
                loadstring(game:HttpGet('https://raw.githubusercontent.com/mama9775/main-script.lua/main/Autofarm.lua'))()
            else
                OrionLib:MakeNotification({
                    Name = "Toggled Off!",
                    Content = "",
                    Time = 5
                })  
            end
        end    
    })
    LocalTab:AddSlider({
        Name = "WalkSpeed",
        Min = 16, -- I dont think less works <3
        Max = 200, -- Default Cap
        Default = 16, -- Default Speed
        Color = Color3.fromRGB(0, 0, 0),
        Increment = 1,
        ValueName = "Speed",
        Callback = function(walkSpeed)
            local plr = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if plr then
                plr.WalkSpeed = walkSpeed
            end
        end    
    })
    LocalTab:AddDropdown({
        Name = "Credits",
        Default = "47",
        Options = {"16","47", "100"},
        Callback = function(speed)
            local player = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if player then
                player.WalkSpeed = speed
            end
        end
    })
    LocalTab:AddButton({
        Name = "Button Active",
        Callback = function()
            local player = game:GetService("Players")
            local rock = workspace:FindFirstChild("BatCaveRock")
            if rock then
                rock.Position = Vector3.new(-237.45799255371094, -73.03600311279297, -554.891845703125)
            end
            local positions = {
                workspace.JungleArea.TempleDoor.ButtonFolder.Button1.Position,
                workspace.JungleArea.TempleDoor.ButtonFolder.Button2.Position,
                workspace.JungleArea.TempleDoor.ButtonFolder.Button3.Position,
                workspace.JungleArea.TempleDoor.ButtonFolder.Button4.Position,
                workspace.TowerArea.Outside.RabbitCage.DoorModel.Button.Position,
                workspace.SavannaArea.LionessButton.Button.Position,
                workspace.SavannaArea.RhinoButton.Button.Position,
                workspace.FarmArea.DonkeyDoor.Button.Position
            }
            for _, position in ipairs(positions) do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(position))
                wait(1)
            end
            wait(5)
            workspace.SavannaArea.RhinoButton.Cage:Destroy()
            workspace.SavannaArea.Maze.Walls:Destroy()
            workspace.SavannaArea.Rocks.Rock:Destroy()
            workspace.JungleArea.Logs:Destroy()
            workspace.RiverArea.CatfishNest:Destroy()
        end
    })
end
