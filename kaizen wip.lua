repeat task.wait()
until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local RootPart = Character.HumanoidRootPart
local Humanoid = Character.Humanoid

local Workspace = game:GetService("Workspace")

local TweenService = game:GetService("TweenService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local VirtualInput = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

local TeleportService = game:GetService("TeleportService")

local HttpService = game:GetService("HttpService")

local PlaceId = game.PlaceId



local function Hop()
    TeleportService:Teleport(PlaceId)
end


function UpdateCharacter()
    Character = Player.Character or Player.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
end
UpdateCharacter()
Player.CharacterAdded:Connect(UpdateCharacter)

    local Env = getgenv()

    Env.Configs = {
        ["FarmBoss"] = true,
        ["FarmMon"] = false
    }

    Env.SettingsFarm = {
        ["Farm"] = "Level_280",
        ["Weapon"] = "Blood Scythe"
    }
    
    Env.WorldBoss = { 
        "eso", 
        "gojo", 
        "sukuna", 
        "itadori",
        "kashimo",
        "uraume"
    }

    Env.QuestPro = {
        ["Level_30"] = {
            ["Quest"] = buffer.fromstring(":\000\003\000Rin\001\000"),
            ["Mon"] = "cursedfrog",
            ["Cf"] = Vector3.new(1117, 63, -920),
            ["Dis"] = 6
        },
        ["Level_33"] = {
            ["Quest"] = buffer.fromstring(":\000\a\000Hisashi\001\000"),
            ["Mon"] = "grasshoppercurse",
            ["Cf"] = Vector3.new(923, 131, -491),
            ["Dis"] = 6
        },
        ["Level_34"] = {
            ["Quest"] = buffer.fromstring(":\000\005\000Akira\001\000"),
            ["Mon"] = "mushroomcurse",
            ["Cf"] = Vector3.new(733, 149, -1469),
            ["Dis"] = 6
        },
        ["Level_40"] = {
            ["Quest"] = buffer.fromstring(":\000\005\000Akira\002\000"),
            ["Mon"] = "mushroomheadcurse",
            ["Cf"] = Vector3.new(680, 124, -1256),
            ["Dis"] = 6
        },
        ["Level_45"] = {
            ["Quest"] = buffer.fromstring(":\000\005\000Osamu\001\000"), -- Osamu
            ["Mon"] = "beetlecurse",
            ["Cf"] = Vector3.new(1245, 173, -2092),
            ["Dis"] = 6
        },
        ["Level_55"] = {
            ["Quest"] = buffer.fromstring(":\000\004\000Taro\001\000"), -- Taro
            ["Mon"] = "demonhead",
            ["Cf"] = Vector3.new(501, 136, -2549),
            ["Dis"] = 6
        },
        ["Level_70"] = {
            ["Quest"] = buffer.fromstring(":\000\003\000Rei\001\000"), -- Sorcerer
            ["Mon"] = "frozencorpse",
            ["Cf"] = Vector3.new(-133, 334, -1755),
            ["Dis"] = 6
        },
        ["Level_78"] = {
            ["Quest"] = buffer.fromstring(":\000\005\000Kaori\001\000"), -- kaori
            ["Mon"] = "deathhowlcurse",
            ["Cf"] = Vector3.new(-763, 323, -1725),
            ["Dis"] = 6
        },
        ["Level_85"] = {
            ["Quest"] = buffer.fromstring(":\000\006\000Itsuki\001\000"), -- itsuki
            ["Mon"] = "frostboundtitan",
            ["Cf"] = Vector3.new(-247, 448, -1486),
            ["Dis"] = 6
        },
        ["Level_91"] = {
            ["Quest"] = buffer.fromstring(":\000\a\000Tetsuya\001\000"), -- tetsuya
            ["Mon"] = "slime",
            ["Cf"] = Vector3.new(3822, -13, -1509),
            ["Dis"] = 6
        },
        ["Level_125"] = {
            ["Quest"] = buffer.fromstring(":\000\025\000Scared Civilian - Shibuya\001\000"), -- Scared Civilian
            ["Mon"] = "thornmawcurse",
            ["Cf"] = Vector3.new(1370, 167, 963),
            ["Dis"] = 6
        },
        ["Level_140"] = {
            ["Quest"] = buffer.fromstring(":\000\014\000Yuta - Shibuya\001\000"), -- Yuta
            ["Mon"] = "twistedmawcurse",
            ["Cf"] = Vector3.new(688, 180, 2094),
            ["Dis"] = 6
        },
        ["Level_170"] = {
            ["Quest"] = buffer.fromstring(":\000\016\000Nanami - Shibuya\001\000"), -- Nanami
            ["Mon"] = "wailingtitan",
            ["Cf"] = Vector3.new(960, 181, 3014),
            ["Dis"] = 6
        },
        ["Level_185"] = {
            ["Quest"] = buffer.fromstring("=\000\016\000Nanami - Shibuya\002\000"), -- Nanami
            ["Mon"] = "ironcladgnasher",
            ["Cf"] = Vector3.new(957, 181, 3007),
            ["Dis"] = 0
        },
        ["Level_265"] = {
            ["Quest"] = buffer.fromstring("=\000\a\000Kamfuji\001\000"), -- Kamfuji
            ["Mon"] = "golem_beach",
            ["Cf"] = Vector3.new(85, 181, 3036),
            ["Dis"] = 6
        },
        ["Level_280"] = {
            ["Quest"] = buffer.fromstring("=\000\a\000Sutoshi\001\000"), -- Sutoshi
            ["Mon"] = "senseiklops_beach",
            ["Cf"] = Vector3.new(-78, 181, 3238),
            ["Dis"] = 6
        }
    }


local Tween = nil
local function TweenToPlace(EndPoint, Speed)
    if Tween then Tween:Cancel() Tween = nil end
    if not Character then return end
    local Humanoid = Character:FindFirstChild("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not Humanoid or not RootPart then return end
    if Humanoid.Health <= 0 then return end
    RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 200, 0)
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

local function Attack()
    local args = {
        {
            buffer = buffer.fromstring("\029\000\000\000Movesets/Weapons/Blood Scythe\001\000\000\000\000"),
            blobs = {}
        }
    }
    ReplicatedStorage:WaitForChild("@rbxts/wcs:source/networking@GlobalEvents"):WaitForChild("requestSkill"):FireServer(unpack(args))
    task.wait()
    local args = {
	{
		buffer = buffer.fromstring("\029\000\000\000Movesets/Weapons/Blood Scythe\000\000\000\000\000"),
		blobs = {}
	}
    }
    ReplicatedStorage:WaitForChild("@rbxts/wcs:source/networking@GlobalEvents"):WaitForChild("requestSkill"):FireServer(unpack(args))
end

local function GetQuest(Buff)
    game:GetService("ReplicatedStorage").Source.Shared.Packages.Nodeware.Utilities["RE//Nodeware/PacketsSync"]:FireServer(Buff)
end


-- local DistFar = (Player.Character.HumanoidRootPart.Position - QuestPro[Input].Cf).Magnitude
-- print(DistFar)
-- TweenToPlace(QuestPro[Input].Cf, 150)
task.spawn(function()
    while Configs.FarmMon do task.wait()
        for _,Mon in pairs(Workspace.Enemies:GetDescendants()) do
            local ChestBoss = Workspace.Effects:FindFirstChild("TestChest")
            if ChestBoss then
                RootPart.CFrame = ChestBoss:GetPivot()
            end
            local DistFar = (Player.Character.HumanoidRootPart.Position - QuestPro[SettingsFarm.Farm].Cf).Magnitude
            if DistFar > 300 then
                TweenToPlace(QuestPro[SettingsFarm.Farm].Cf, 150)
            end
            if Mon:GetAttribute("EnemyName") == nil then
                continue
            end
            if Mon:GetAttribute("EnemyName"):lower() ~= QuestPro[SettingsFarm.Farm].Mon then
                continue
            end
            if Player.PlayerGui.HUD.HUDContainer.Top.Top.Lower.Quest.Visible == false then
                task.wait(.6)
                RootPart.CFrame = CFrame.new(QuestPro[SettingsFarm.Farm].Cf)
                task.wait(.6)
                GetQuest(QuestPro[SettingsFarm.Farm].Quest)
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
                            RootPart.CFrame = (MonRootPart.CFrame or MonModel) * CFrame.new(0, 0, QuestPro[SettingsFarm.Farm].Dis) * CFrame.Angles(math.rad(0),0,0)
                        end
                        Attack()
                    until not Configs.FarmMon or MonHum.Health <= 0
                end
            end
        end
    end
end)


while Configs.FarmBoss do task.wait()
    local ChestBoss = Workspace.Effects:FindFirstChild("TestChest")
    if ChestBoss then
        RootPart.CFrame = ChestBoss:GetPivot()
    end
    for _,Boss in pairs(Workspace.Enemies.Bosses:GetChildren()) do
        if table.find(WorldBoss, Boss:GetAttribute("EnemyName"):lower()) and Boss:FindFirstChild("Humanoid") then
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
            if not CharWork then
                break
            elseif CharWork:GetAttribute("currentCombo") == 5 then
                RootPart.CFrame = PoBoss * CFrame.new(0, 0, 18) * CFrame.Angles(math.rad(0),0,0)
            else
                RootPart.CFrame = PoBoss * CFrame.new(0, 0, 6) * CFrame.Angles(math.rad(0),0,0)
            end
            Attack()
        -- else
        --     Hop()
        end
    end
end
print("Done!")
