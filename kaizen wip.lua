repeat task.wait()
until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local Backpack = Player:WaitForChild("Backpack")

local Workspace = game:GetService("Workspace")

local TweenService = game:GetService("TweenService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local VirtualInput = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

local TeleportService = game:GetService("TeleportService")

local HttpService = game:GetService("HttpService")

local PlaceId = game.PlaceId

local Enemies = Workspace:WaitForChild("Enemies")
local Effects = Workspace:WaitForChild("Effects")

local Env = getgenv()

-- Env.Configs = {
--     ["Farm_Boss"] = true,
--     ["Farm_Mon"] = false,
--     ["Farm_Raid"] = false,
--     ["Settings"] = {
--         ["AutoWeapon"] = true,
--         ["Hop_Server_Boss"] = true
--     }
-- }
    
Env.SettingsFarm = {
    ["Farm"] = "Level_280",
    ["Weapon"] = "Blood Scythe",
    ["Hop_Server_Boss"] = false
}

Env.WorldBoss = { 
    "eso", 
    "gojo", 
    "sukuna", 
    "itadori",
    "kashimo",
    "uraume"
}
    
Env.__Quest = {
    ["Level_30 Cursed Frog"] = {
        ["Quest"] = buffer.fromstring(":\000\003\000Rin\001\000"),
        ["Mon"] = "cursedfrog",
        ["Cf"] = Vector3.new(1117, 63, -920),
        ["Dis"] = 6
    },
    ["Level_33 Grasshopper Boss"] = {
        ["Quest"] = buffer.fromstring(":\000\a\000Hisashi\001\000"),
        ["Mon"] = "grasshoppercurse",
        ["Cf"] = Vector3.new(923, 131, -491),
        ["Dis"] = 6
    },
    ["Level_34 Mushroom Curse"] = {
        ["Quest"] = buffer.fromstring(":\000\005\000Akira\001\000"),
        ["Mon"] = "mushroomcurse",
        ["Cf"] = Vector3.new(733, 149, -1469),
        ["Dis"] = 6
    },
    ["Level_40 Mushroom Head Curse"] = {
        ["Quest"] = buffer.fromstring(":\000\005\000Akira\002\000"),
        ["Mon"] = "mushroomheadcurse",
        ["Cf"] = Vector3.new(680, 124, -1256),
        ["Dis"] = 6
    },
    ["Level_45 Beetle Curse"] = {
        ["Quest"] = buffer.fromstring(":\000\005\000Osamu\001\000"), -- Osamu
        ["Mon"] = "beetlecurse",
        ["Cf"] = Vector3.new(1245, 173, -2092),
        ["Dis"] = 6
    },
    ["Level_55 Demon Head"] = {
        ["Quest"] = buffer.fromstring(":\000\004\000Taro\001\000"), -- Taro
        ["Mon"] = "demonhead",
        ["Cf"] = Vector3.new(501, 136, -2549),
        ["Dis"] = 6
    },
    ["Level_70 Frozen Corpse"] = {
        ["Quest"] = buffer.fromstring(":\000\003\000Rei\001\000"), -- Sorcerer
        ["Mon"] = "frozencorpse",
        ["Cf"] = Vector3.new(-133, 334, -1755),
        ["Dis"] = 6
    },
    ["Level_78 Death Howl Curse"] = {
        ["Quest"] = buffer.fromstring(":\000\005\000Kaori\001\000"), -- kaori
        ["Mon"] = "deathhowlcurse",
        ["Cf"] = Vector3.new(-763, 323, -1725),
        ["Dis"] = 6
    },
    ["Level_85 Frost Bound Titan"] = {
        ["Quest"] = buffer.fromstring(":\000\006\000Itsuki\001\000"), -- itsuki
        ["Mon"] = "frostboundtitan",
        ["Cf"] = Vector3.new(-247, 448, -1486),
        ["Dis"] = 6
    },
    ["Level_91 Slime"] = {
        ["Quest"] = buffer.fromstring(":\000\a\000Tetsuya\001\000"), -- tetsuya
        ["Mon"] = "slime",
        ["Cf"] = Vector3.new(3822, -13, -1509),
        ["Dis"] = 6
    },
    ["Level_125 Thornmaw Curse"] = {
        ["Quest"] = buffer.fromstring(":\000\025\000Scared Civilian - Shibuya\001\000"), -- Scared Civilian
        ["Mon"] = "thornmawcurse",
        ["Cf"] = Vector3.new(1370, 167, 963),
        ["Dis"] = 6
    },
    ["Level_140 Twistedmaw Curse"] = {
        ["Quest"] = buffer.fromstring(":\000\014\000Yuta - Shibuya\001\000"), -- Yuta
        ["Mon"] = "twistedmawcurse",
        ["Cf"] = Vector3.new(688, 180, 2094),
        ["Dis"] = 6
    },
    ["Level_170 Wailing Titan"] = {
        ["Quest"] = buffer.fromstring(":\000\016\000Nanami - Shibuya\001\000"), -- Nanami
        ["Mon"] = "wailingtitan",
        ["Cf"] = Vector3.new(960, 181, 3014),
        ["Dis"] = 6
    },
    ["Level_185 Ironclad Gnasher Boss"] = {
        ["Quest"] = buffer.fromstring("=\000\016\000Nanami - Shibuya\002\000"), -- Nanami
        ["Mon"] = "ironcladgnasher",
        ["Cf"] = Vector3.new(957, 181, 3007),
        ["Dis"] = 0
    },
    ["Level_265 Golem Beach"] = {
        ["Quest"] = buffer.fromstring("=\000\a\000Kamfuji\001\000"), -- Kamfuji
        ["Mon"] = "golem_beach",
        ["Cf"] = Vector3.new(85, 181, 3036),
        ["Dis"] = 6
    },
    ["Level_280 Senseiklops Bleach Boss"] = {
        ["Quest"] = buffer.fromstring("=\000\a\000Sutoshi\001\000"), -- Sutoshi
        ["Mon"] = "senseiklops_beach",
        ["Cf"] = Vector3.new(-78, 181, 3238),
        ["Dis"] = 6
    },
    ["Level_325 Lanternfish Beach Boss"] = {
        ["Quest"] = buffer.fromstring("=\000\006\000Minato\001\000"), -- Minato
        ["Mon"] = "lanternfish_beach",
        ["Cf"] = Vector3.new(-1749, 113, 4227),
        ["Dis"] = 6
	}
}

Env.__Raid = {
    ["Zenin_Raid"] = {
        ["Mon"] = {
            "zeninsorcerer",
            "fallenzeninsorcerer",
            "maki"
        }
    }
}


-- // function

local function Hop()
    TeleportService:Teleport(PlaceId)
end

local function UpdateCharacter()
    Character = Player.Character or Player.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
end
UpdateCharacter()
Player.CharacterAdded:Connect(UpdateCharacter)

local Tween = nil
local function TweenToPlace(EndPoint, Speed)
    if Tween then Tween:Cancel() Tween = nil end
    if not Character then return end
    local Humanoid = Character:FindFirstChild("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not Humanoid or not RootPart then return end
    if Humanoid.Health <= 0 then return end
    RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 50, 0)
    local Distance = (RootPart.Position - EndPoint).Magnitude
    local Time = Distance / Speed
    local TweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    Tween = TweenService:Create(RootPart, TweenInfo, {CFrame = CFrame.new(EndPoint)})
    Tween:Play()
    Tween.Completed:Wait()
    task.wait()
end

local function AutoSkill(pad)
    VirtualInput:SendKeyEvent(true, pad, false, RootPart)
    task.wait()
    VirtualInput:SendKeyEvent(false, pad, false, RootPart)
end

local function GetQuest(Buff)
    game:GetService("ReplicatedStorage").Source.Shared.Packages.Nodeware.Utilities["RE//Nodeware/PacketsSync"]:FireServer(Buff)
end


local function SelectSword()
    if getgenv().Configs and getgenv().Configs.Settings.AutoWeapon then
        local SwordTable = {}
        for _,Sword in ipairs(ReplicatedStorage.Source.Client.Combat.Skills.Movesets.Weapons:GetChildren()) do
            table.insert(SwordTable, Sword.Name)
        end
        for _,tool in ipairs(Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                if table.find(SwordTable, tool.Name) then
                    return tool.Name
                end
            end
        end
    end
end
print(SelectSword())




local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Raid = Window:AddTab({ Title = "Raids", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "Paragraph",
        Content = "This is a paragraph.\nSecond line!"
    })



    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

	Humanoid:UnequipTools()
	local Tools = {}
	for _,tool in ipairs(Backpack:GetChildren()) do
		if tool:IsA("Tool") then
			table.insert(Tools, tool.Name)
		end
	end

    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Select Weapon",
        Values = Tools,
        Multi = false,
        Default = Tools[1],
    })
    if getgenv().Configs and getgenv().Configs.Settings.AutoWeapon then
        Dropdown:SetValue(SelectSword())
    end

    Dropdown:OnChanged(function(Value)
        SettingsFarm.Weapon =  Value
    end)

	local Selection = {}
	for i,v in pairs(__Quest) do
		table.insert(Selection, i)
	end

	local Dropdown1 = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = Selection,
        Multi = false,
        Default = Selection[1],
    })

    -- Dropdown:SetValue("four")

    Dropdown1:OnChanged(function(Value1)
        SettingsFarm.Farm = Value1
    end)


    local Toggle = Tabs.Main:AddToggle("MonsterToggle", {Title = "Auto Monster", Default = false })

    Toggle:OnChanged(function()
		if Options.MonsterToggle.Value and PlaceId == 17662297954 then
		    task.spawn(function()
				while Options.MonsterToggle.Value do task.wait()
					for _,Mon in pairs(Enemies:GetDescendants()) do
						local ChestBoss = Effects:FindFirstChild("TestChest")
						if ChestBoss then
							task.wait(2)
							RootPart.CFrame = ChestBoss:GetPivot()
						end
						local DistFar = (Player.Character.HumanoidRootPart.Position - __Quest[SettingsFarm.Farm].Cf).Magnitude
						if DistFar > 350 then
							task.wait()
							TweenToPlace((__Quest[SettingsFarm.Farm].Cf + Vector3.new(0, 3, 0)), 150)
						end
						if Mon:GetAttribute("EnemyName") == nil then
							continue
						end
						if Mon:GetAttribute("EnemyName"):lower() ~= __Quest[SettingsFarm.Farm].Mon then
							continue
						end
						if Player.PlayerGui.HUD.HUDContainer.Top.Top.Lower.Quest.Visible == false then
							task.wait(.6)
							RootPart.CFrame = CFrame.new(__Quest[SettingsFarm.Farm].Cf)
							task.wait(.6)
							GetQuest(__Quest[SettingsFarm.Farm].Quest)
						end
						local MonRootPart = Mon:FindFirstChild("HumanoidRootPart")
						local MonHum = Mon:FindFirstChild("Humanoid")
						local MonModel = Mon:GetPivot()
						if (MonRootPart or MonHum) and Mon.Humanoid.Health > 0 then
							if not MonModel or not MonHum then
								break
							end
							if (MonRootPart or MonHum) and MonModel then
								repeat
									task.wait()
									if game:GetService("Players").LocalPlayer.PlayerGui.ClashMinigame.CanvasGroup.Visible == true then
										AutoSkill(Enum.KeyCode.Z)
										task.wait(.1)
										AutoSkill(Enum.KeyCode.X)
										task.wait(.1)
										AutoSkill(Enum.KeyCode.C)
										task.wait(.1)
										AutoSkill(Enum.KeyCode.V)
                        			end
									local HealthMon = MonHum.Health
									local Backpack = Player.Backpack:GetChildren()
									for i,v in pairs(Backpack) do
										if v:IsA("Tool") then
											if v.Name == SettingsFarm.Weapon then
												Humanoid:EquipTool(v)
											end
										end
									end
									if not Character or not Humanoid or Humanoid.Health <= 0 then
										break
									end
									local CharWork = Workspace.Characters:FindFirstChild(Player.Name)
									if not CharWork then
										break
									elseif CharWork:GetAttribute("currentCombo") == 5 then
										RootPart.CFrame = (MonRootPart.CFrame or MonModel) * CFrame.new(0, 0, 18) * CFrame.Angles(math.rad(0),0,0)
										AutoSkill(Enum.KeyCode.Z)
									else
                                        if MonRootPart then
										    RootPart.CFrame = MonRootPart.CFrame * CFrame.new(0, 0, __Quest[SettingsFarm.Farm].Dis) * CFrame.Angles(math.rad(0),0,0)
                                        else
                                            RootPart.CFrame = MonModel * CFrame.new(0, 0, __Quest[SettingsFarm.Farm].Dis) * CFrame.Angles(math.rad(0),0,0)
                                        end
									end
									
									-- Attack()
								until not Options.MonsterToggle.Value or HealthMon <= 0 or Mon.Parent == nil
							end
						end
					end
				end
			end)
		end
    end)
    if getgenv().Configs and getgenv().Farm_Mon then
        Options.MonsterToggle:SetValue(Configs.Farm_Mon)
    end

	local Toggle1 = Tabs.Main:AddToggle("WorldBossToggle", {Title = "Auto WorldBoss", Default = false })

    Toggle1:OnChanged(function()
		if Options.WorldBossToggle.Value and PlaceId == 17662297954 then
			task.spawn(function()
				while Options.WorldBossToggle.Value do task.wait()
					for _,Boss in pairs(Enemies.Bosses:GetChildren()) do
						if table.find(WorldBoss, Boss:GetAttribute("EnemyName"):lower()) and Boss:FindFirstChild("Humanoid") then
							repeat
								if game:GetService("Players").LocalPlayer.PlayerGui.ClashMinigame.CanvasGroup.Visible == true then
									AutoSkill(Enum.KeyCode.Z)
									task.wait(.1)
									AutoSkill(Enum.KeyCode.X)
									task.wait(.1)
									AutoSkill(Enum.KeyCode.C)
									task.wait(.1)
									AutoSkill(Enum.KeyCode.V)
                        		end
								task.wait()
								local CharWork = Workspace.Characters:FindFirstChild(Player.Name)
								local PoBoss = Boss:GetPivot()
								local Backpack = Player.Backpack:GetChildren()
								for i,v in pairs(Backpack) do
									if v:IsA("Tool") then
										if v.Name == SettingsFarm.Weapon then
											Humanoid:EquipTool(v)
										end
									end
								end
								if not CharWork and PoBoss then
									break
								elseif CharWork:GetAttribute("currentCombo") == 5 then
									RootPart.CFrame = PoBoss * CFrame.new(0, 0, 18) * CFrame.Angles(math.rad(0),0,0)
								else
									RootPart.CFrame = PoBoss * CFrame.new(0, 0, 6) * CFrame.Angles(math.rad(0),0,0)
								end
								-- Attack()
							until not Boss or not Options.WorldBossToggle.Value or not Boss.Parent
						end
					end
					task.wait(2)
					local ChestBoss = Effects:FindFirstChild("TestChest")
					if ChestBoss then
						RootPart.CFrame = ChestBoss:GetPivot()
					end
					if Configs.Settings.Hop_Server_Boss then
						task.wait(3)
						Hop()
					end
				end
			end)
		end
    end)
    if getgenv().Configs and getgenv().Farm_Boss then
        Options.WorldBossToggle:SetValue(Configs.Farm_Boss)
    end

    local Toggle2 = Tabs.Raid:AddToggle("RaidToggle", {Title = "Auto Raid", Default = false })

    Toggle2:OnChanged(function()
		if Options.RaidToggle.Value then
			task.spawn(function()
                while Options.RaidToggle.Value do task.wait()
                    if Workspace.Map:FindFirstChild("Zenin") then
                        RootPart.CFrame = CFrame.new(0, 1039, 2691)
                        task.wait(1)
                        RootPart.CFrame = CFrame.new(-3, 996, 3564)
                        task.wait(1)
                        RootPart.CFrame = CFrame.new(807, 997, 3915)
                        task.wait(1)
                    end
                    for _,MonRaid in pairs(Enemies:GetDescendants()) do
                        local ChestBoss = Effects:FindFirstChild("CursedChest_Purple")
                        if ChestBoss then
                            RootPart.CFrame = ChestBoss:GetPivot()
                        end
                        
                        -- local DistFar = (Player.Character.HumanoidRootPart.Position - __Quest[SettingsFarm.Farm].Cf).Magnitude
                        -- if DistFar > 350 then
                        --     TweenToPlace(__Quest[SettingsFarm.Farm].Cf, 200)
                        -- end
                        if MonRaid:GetAttribute("EnemyName") == nil then
                            continue
                        end
                        if not table.find(__Raid.Zenin_Raid.Mon, MonRaid:GetAttribute("EnemyName"):lower()) then
                            continue
                        end
                        -- if Player.PlayerGui.HUD.HUDContainer.Top.Top.Lower.Quest.Visible == false then
                        --     task.wait(.6)
                        --     RootPart.CFrame = CFrame.new(__Quest[SettingsFarm.Farm].Cf)
                        --     task.wait(.6)
                        --     GetQuest(__Quest[SettingsFarm.Farm].Quest)
                        -- end
                        local MonRootPart = MonRaid:FindFirstChild("HumanoidRootPart")
                        local MonHum = MonRaid:FindFirstChild("Humanoid")
                        local MonModel = MonRaid:GetPivot()
                        if (MonRootPart or MonHum) and MonRaid.Humanoid.Health > 0 then
                            if not MonModel or not MonHum then
                                break
                            end
                            if (MonRootPart or MonHum) and MonModel then
                                repeat
                                    task.wait()
                                    if game:GetService("Players").LocalPlayer.PlayerGui.ClashMinigame.CanvasGroup.Visible == true then
                                        AutoSkill(Enum.KeyCode.Z)
                                        task.wait(.1)
                                        AutoSkill(Enum.KeyCode.X)
                                        task.wait(.1)
                                        AutoSkill(Enum.KeyCode.C)
                                        task.wait(.1)
                                        AutoSkill(Enum.KeyCode.V)
                                    end
                                    local HealthMon = MonHum.Health
                                    local Backpack = Player.Backpack:GetChildren()
                                    for i,v in pairs(Backpack) do
                                        if v:IsA("Tool") then
                                            if v.Name == SettingsFarm.Weapon then
                                                Humanoid:EquipTool(v)
                                            end
                                        end
                                    end
                                    if not Character or not Humanoid or Humanoid.Health <= 0 then
                                        break
                                    end
                                    local CharWork = Workspace.Characters:FindFirstChild(Player.Name)
                                    if not CharWork then
                                        break
                                    elseif CharWork:GetAttribute("currentCombo") == 5 then
                                        RootPart.CFrame = (MonRootPart.CFrame or MonModel) * CFrame.new(0, 0, 18) * CFrame.Angles(math.rad(0),0,0)
                                        AutoSkill(Enum.KeyCode.Z)
                                    else
                                        RootPart.CFrame = (MonRootPart.CFrame or MonModel) * CFrame.new(0, 0, 6) * CFrame.Angles(math.rad(0),0,0)
                                    end
                                    -- Attack()
                                until not Options.RaidToggle.Value or HealthMon <= 0 or MonRaid.Parent == nil
                            end
                        end
                    end
                end
            end)
		end
    end)
    if getgenv().Configs and getgenv().Fard_Raid then
        Options.RaidToggle:SetValue(Configs.Farm_Raid)
    end

    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)




    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
