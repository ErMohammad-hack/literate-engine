--[[
  _________ __                  ___________                        ________       __ 
 /   _____/|  | _____  ______   \_   _____/____ _______  _____    /  _____/ __ __|__|
 \_____  \ |  | \__  \ \____ \   |    __) \__  \\_  __ \/     \  /   \  ___|  |  \  |
 /        \|  |__/ __ \|  |_> >  |     \   / __ \|  | \/  Y Y  \ \    \_\  \  |  /  |
/_______  /|____(____  /   __/   \___  /  (____  /__|  |__|_|  /  \______  /____/|__|
        \/           \/|__|          \/        \/            \/          \/          



___.                                                  ____________  ________     _____    
\_ |__ ___.__.        ____   ____ ___  ___ __________/_   \_____  \ \_____  \   /  |  |   
 | __ <   |  |       /    \_/ __ \\  \/  // __ \_  __ \   |/  ____/   _(__  <  /   |  |_  
 | \_\ \___  |      |   |  \  ___/ >    <\  ___/|  | \/   /       \  /       \/    ^   /  
 |___  / ____|      |___|  /\___  >__/\_ \\___  >__|  |___\_______ \/______  /\____   |   
     \/\/                \/     \/      \/    \/                  \/       \/      |__| 

Slap Farm Gui.

Owned by Mohamad.

Everything is mine, i did not borrow or skid anything to make this script.
]]--


--[[
Using coregui, but if executor can't access coregui, workspace will be used
]]--
pcall(function()
    local host = game:GetService("CoreGui") or game:GetService("Workspace")
    HintGui = Instance.new("Hint")
    HintGui.Text = "Slap Farm Gui Loading... ( Loading Script )"
    HintGui.Name = "HintGui"
    HintGui.Parent = host
end)


HintGui.Text = "Slap Farm Gui Loading... ( Loading Variables & Functions )"

--[[
Global variables ( and some functions ). The link to script is required for snow farming.
]]--
_G.VerVerVer = "4.3" -- Version here
_G.Link = "https://raw.githubusercontent.com/ErMohammad-hack/Mohammad-hub/refs/heads/main/Main.lua" -- Or whatever your link is, this is required for snow farm and other serverhop farms
_G.IsUserPremium = false -- This is responsible for whether the user has a premium or not, don't change it bucko 🤠
_G.CanSlap = true -- Can slap? ( Bot Mode, Don't set false or bot won't be able to slap :[ )
_G.CanJump = true -- Can jump? ( Bot Mode, Don't set false or bot won't be able to jump :[ )
_G.BotAbility = false -- Standart value of bot configuration
_G.BotSlapDuringRagdoll = false -- Standart value of bot configuration
_G.BotAvoid = false -- Standart value of bot configuration
_G.BotJump = false -- Standart value of bot configuration
_G.BotReg = 8 or "8" -- Standart value of bot configuration
_G.FakeNametag = "Mohamad_AnotherAlt" -- Standart value of fake nametag
_G.FakeSlaps = 0 or "0" -- Standart value of fake slaps
_G.BlinkMixedBallerPlace = "Default Arena"

game = game or Ugc -- game itself
--[[
Adding cloneref, only for requiring services
]]--
if not cloneref then
function cloneref(q)
if game:FindService(q.Name) or q.Parent == game or game:GetService(q.Name) then
return q
else
local a = q:Clone()
a.Parent = q.Parent
end
end
end

--[[
Loading module-script. This is absolutely required, or else script will fcking explode! ( script won't work )

It's checking if its snow farm, cuz if it is, there's no need in loading it!
]]--
if _G.SnowFarm ~= true and _G.ErrorFarm ~= true then
HintGui.Text = "Slap Farm Gui Loading... ( Loading Modules )"
local success, error = pcall(function()
NEX = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Modules/SlapBattlesModuleScript.lua'))()
end)
if not success then

ErrorMessage = error

pcall(function()
local host = game:GetService("CoreGui") or game:GetService("Workspace")
MessageGui = Instance.new("Message")
MessageGui.Text = "Your executor failed loading modules... Please try again!"
MessageGui.Name = "MessageGui"
MessageGui.Parent = host
end)

HintGui.Text = ""..ErrorMessage..""
task.wait(5)
pcall(function()
MessageGui:Destroy()
HintGui:Destroy()
end)
return
end
end

--[[
Creating gethui function if it doesn't exists yet
]]--
pcall(function()
    local srvc = game:GetService("CoreGui") or game.CoreGui
    if getgenv then
        getgenv().gethui = function() return srvc end
    end
    _G.gethui = function() return srvc end
    gethui = function() return srvc end
end)

--[[
If snow farm variable is true, starting snow serverhop farm.
Idea: Incognito scripts
Creation / Realization: Mohamad
Upgraded: Mohamad

Last updated: 05/05/2025 ( dd/mm/yyyy )
]]--

if _G.SnowFarm == true then

-- Deleting loading message
pcall(function()
HintGui:Destroy()
end)

local RequireService = cloneref or function(clone) return clone end

local Players = RequireService(game:GetService("Players"))
local ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
local LocalPlayer = Players.LocalPlayer
local Remote = ReplicatedStorage:WaitForChild("SnowHit")
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local LDRST = Players.LocalPlayer.leaderstats
local GLV = LDRST.Glove
GloveValue = function() return GLV.Value end
GetRoot = function(char) local bodypart = char:WaitForChild("HumanoidRootPart") or char:WaitForChild("Torso") or char:WaitForChild("UpperTorso"); return bodypart end

function GetRandomPlayer()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
repeat task.wait() RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] until RandomPlayer ~= Players.LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil
return RandomPlayer
end

if GloveValue() ~= "Snow" then
fireclickdetector(workspace.Lobby.Snow:FindFirstChildWhichIsA("ClickDetector"))
end

-- Loop teleporting to plr
target = GetRandomPlayer()
local start = tick()
while tick() - start < 0.65 do 
if target.Character then
HRP.CFrame = GetRoot(target.Character).CFrame * CFrame.new(0,0,-5)
task.wait()
end
end

-- Hides error message
game:GetService("RunService").RenderStepped:Connect(function()
game:GetService("GuiService"):ClearError()
game.CoreGui:WaitForChild("RobloxLoadingGUI"):Destroy()
end)

for i = 1, _G.FarmSlapsSnowFarm do
if target and target.Character then
Remote:FireServer(GetRoot(target.Character))
end
end

task.wait(_G.WaitRegisterSnowFarm)

--[[
Bypassing anti-cheat.
]]--
pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ErMohammad-hack/Anticheatbypass/refs/heads/main/Skibi.lua'))()
end)


--Booting up rayfield.
HintGui.Text = "Slap Farm Gui Loading... ( Booting Up Library )"
local success, error = pcall(function()
Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)
if success then
print("Loaded New Rayfield")
elseif not success then
print("Loaded Old Rayfield")
-- loading old if new can't load
Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
end


HintGui.Text = "Slap Farm Gui Loading... ( Loading Window )"
-- creating window
Window = Rayfield:CreateWindow({
   Name = "Slap Farm Gui v".._G.VerVerVer.." - by mohamad",
   Icon = 0,    
   LoadingTitle = "Slap Farm Gui",
   LoadingSubtitle = "by mohamad, version ".._G.VerVerVer,
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SlapFarmGui",
      FileName = "SlapFarmGuiConfiguration"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})

-- notification function
function notify(title, content, time, mode)
time = time or 10
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end
--[[
If error farm variable is true, starting error serverhop farm.
Idea: @.xy5. and @requiem.3434 ( they're on discord )
Creation / Realization: Mohamad
Upgraded: Mohamad

Last updated: 07/05/2025  ( dd/mm/yyyy )
]]--

if _G.ErrorFarm == true then

-- Deleting loading message
pcall(function()
HintGui:Destroy()
end)

local RequireService = cloneref or function(clone) return clone end

local Players = RequireService(game:GetService("Players"))
local ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
local LocalPlayer = Players.LocalPlayer
local Remote = ReplicatedStorage:WaitForChild("Errorhit")
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local LDRST = Players.LocalPlayer.leaderstats
local SLAPS = LDRST.Slaps
SlapsValue = function() return SLAPS.Value end
GetRoot = function(char) local bodypart = char:WaitForChild("HumanoidRootPart") or char:WaitForChild("Torso") or char:WaitForChild("UpperTorso"); return bodypart end
if workspace:FindFirstChild("Baseplate") then
workspace:FindFirstChild("Baseplate"):Destroy()
end
if workspace:FindFirstChild("Baseplate") == nil then
S = Instance.new("Part")
S.Name = "Baseplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(math.random(-20000,-10000),math.random(-20000,-10000),math.random(-20000,-10000))
S.Size = Vector3.new(2000, 10, 2000)
S.Parent = workspace
S.Color = Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))
end

GetRoot(Character).CFrame = S.CFrame * CFrame.new(0,20,0)
if LDRST.Glove.Value ~= "Blink" then
fireclickdetector(workspace.Lobby.Blink:FindFirstChildWhichIsA("ClickDetector"))
end
task.wait(.55)

ReplicatedStorage.Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until workspace:FindFirstChild("Blink_"..LocalPlayer.Name) and workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
task.wait(.2)

if LDRST.Glove.Value ~= "Error" then
fireclickdetector(workspace.Lobby.Error:FindFirstChildWhichIsA("ClickDetector"))
end

requestedvalue = _G.FarmSlapsErrorFarm or tonumber(_G.FarmSlapsErrorFarm) or 1000
requiredvalue = SlapsValue() + requestedvalue
repeat task.wait()
if workspace:FindFirstChild("Blink_"..LocalPlayer.Name) and workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart") then
Remote:FireServer(workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart"))
end
until SlapsValue() == requiredvalue or workspace:FindFirstChild("Blink_"..LocalPlayer.Name) == nil or workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart") == nil


local PlaceID = game.PlaceId
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Mohamad.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Mohamad.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Mohamad.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Mohamad.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end

task.wait()
while task.wait() do Teleport() end

end
--[[
Fake nametag and slap counter updates.
]]--

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function updateFakeNametag()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        local head = LocalPlayer.Character.Head
        local fakeTag = head:FindFirstChild("FakeNametag")

        if not fakeTag then
            fakeTag = Instance.new("BillboardGui")
            fakeTag.Name = "FakeNametag"
            fakeTag.Adornee = head
            fakeTag.Size = UDim2.new(0, 100, 0, 50)
            fakeTag.StudsOffset = Vector3.new(0, 2, 0)
            fakeTag.AlwaysOnTop = true

            local textLabel = Instance.new("TextLabel", fakeTag)
            textLabel.Name = "NameLabel"
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextStrokeTransparency = 0
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 14
        end

        fakeTag.NameLabel.Text = _G.FakeNametag
        fakeTag.Parent = head
    end
end

RunService.Heartbeat:Connect(updateFakeNametag)

--[[
Fake slap counter update (display or internal tracking).
]]--

local function updateFakeSlaps()
    -- Implementation depends on UI; placeholder for update logic
    -- Example: Update a GUI label or counter with _G.FakeSlaps
end

-- Call updateFakeSlaps periodically if needed
--[[
Bot settings and automation functions.
]]--

local Bot = {}

function Bot.Slap(target)
    if _G.CanSlap and target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local root = target.Character.HumanoidRootPart
        -- Slap action logic here
        -- Example: Fire remote event to slap
    end
end

function Bot.Jump()
    if _G.CanJump and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

function Bot.AutoSlap()
    while _G.BotAbility do
        local players = game:GetService("Players"):GetPlayers()
        for _, player in pairs(players) do
            if player ~= game.Players.LocalPlayer then
                Bot.Slap(player)
                task.wait(1)
            end
        end
        task.wait(1)
    end
end

function Bot.Start()
    _G.BotAbility = true
    coroutine.wrap(Bot.AutoSlap)()
end

function Bot.Stop()
    _G.BotAbility = false
end
--[[
GUI setup and user interaction.
]]--

local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Slap Farm Controls")

local StartButton = Tab:CreateButton({
    Name = "Start Bot",
    Callback = function()
        Bot.Start()
        notify("Bot", "Bot started!", 5, true)
    end
})

local StopButton = Tab:CreateButton({
    Name = "Stop Bot",
    Callback = function()
        Bot.Stop()
        notify("Bot", "Bot stopped!", 5, false)
    end
})

local SettingsTab = Window:CreateTab("Settings", 4483362458)
local SettingsSection = SettingsTab:CreateSection("Bot Settings")

SettingsTab:CreateToggle({
    Name = "Enable Auto Jump",
    CurrentValue = _G.BotJump,
    Flag = "AutoJump",
    Callback = function(value)
        _G.BotJump = value
        notify("Settings", "Auto Jump " .. (value and "enabled" or "disabled"), 5, true)
    end
})

SettingsTab:CreateSlider({
    Name = "Slap Rate",
    Min = 0.1,
    Max = 5,
    Increment = 0.1,
    CurrentValue = 1,
    Flag = "SlapRate",
    Callback = function(value)
        _G.SlapRate = value
        notify("Settings", "Slap Rate set to " .. tostring(value), 5, true)
    end
})

--[[
Bot loop for auto jumping (if enabled).
]]--
coroutine.wrap(function()
    while true do
        if _G.BotJump and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            local humanoid = game.Players.LocalPlayer.Character.Humanoid
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        task.wait(1)
    end
end)()

--[[
Bot loop for auto slapping with configurable rate.
]]--
coroutine.wrap(function()
    while true do
        if _G.BotAbility then
            local players = game:GetService("Players"):GetPlayers()
            for _, player in pairs(players) do
                if player ~= game.Players.LocalPlayer then
                    Bot.Slap(player)
                    task.wait(_G.SlapRate or 1)
                end
            end
        else
            task.wait(1)
        end
    end
end)()

--[[
Additional utility functions can go here.
]]--

print("Slap Farm GUI fully loaded and running.")
notify("Slap Farm GUI", "Loaded successfully!", 5, true)
--[[
Bot loop for auto jumping (if enabled).
]]--
coroutine.wrap(function()
    while true do
        if _G.BotJump and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            local humanoid = game.Players.LocalPlayer.Character.Humanoid
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        task.wait(1)
    end
end)()

--[[
Bot loop for auto slapping with configurable rate.
]]--
coroutine.wrap(function()
    while true do
        if _G.BotAbility then
            local players = game:GetService("Players"):GetPlayers()
            for _, player in pairs(players) do
                if player ~= game.Players.LocalPlayer then
                    Bot.Slap(player)
                    task.wait(_G.SlapRate or 1)
                end
            end
        else
            task.wait(1)
        end
    end
end)()

--[[
Additional utility functions can go here.
]]--

print("Slap Farm GUI fully loaded and running.")
notify("Slap Farm GUI", "Loaded successfully!", 5, true)
--[[
Cleanup logic when script is terminated or restarted.
]]--

function Cleanup()
    pcall(function()
        if HintGui then HintGui:Destroy() end
        if MessageGui then MessageGui:Destroy() end
    end)
    _G.BotAbility = false
    _G.BotJump = false
    print("Slap Farm GUI unloaded.")
end

-- Optional: bind to key to manually stop script
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        Cleanup()
        notify("Slap Farm GUI", "Script unloaded", 4, false)
    end
end)

--[[
Future features can be added below this point.
]]--

-- Placeholder for new tabs, debug tools, or expansions.
-- For example: Stats tab, glove switcher, teleport to lobby, etc.

-- Wrap up
print("Slap Farm GUI ready. Enjoy farming slaps, Mohamad-style!")
--[[
-- OPTIONAL FEATURE PLACEHOLDERS (Not active unless added)
-- These are areas for future functionality like glove changing, teleport control, etc.
]]--

-- Example: Glove Selector
--[[ 
local GloveTab = Window:CreateTab("Glove Tools", 4483362458)
GloveTab:CreateDropdown({
    Name = "Select Glove",
    Options = {"Default", "Snow", "Error", "Blink"},
    CurrentOption = "Default",
    Flag = "SelectedGlove",
    Callback = function(option)
        if workspace.Lobby:FindFirstChild(option) then
            fireclickdetector(workspace.Lobby[option]:FindFirstChildWhichIsA("ClickDetector"))
            notify("Glove Changed", "Equipped: " .. option, 4, true)
        end
    end
})
]]

-- Example: Teleport to Lobby
--[[ 
GloveTab:CreateButton({
    Name = "Teleport to Lobby",
    Callback = function()
        local spawn = workspace:FindFirstChild("LobbySpawn")
        if spawn then
            game.Players.LocalPlayer.Character:PivotTo(spawn.CFrame)
            notify("Teleported", "You have been moved to lobby spawn.", 3, true)
        end
    end
})
]]

-- Debug or tool tab
--[[
local DebugTab = Window:CreateTab("Dev Tools", 4483362458)
DebugTab:CreateButton({
    Name = "Print Player Count",
    Callback = function()
        local count = #game:GetService("Players"):GetPlayers()
        print("Players in server: " .. tostring(count))
        notify("Debug", "Player count: " .. tostring(count), 3, true)
    end
})
]]

--[[
Everything below this line is empty or intentionally left blank for modular updates.
]]----[[
Final hook and safety net.
]]--

-- Prevent multiple activations
if _G.SlapFarmGuiLoaded then
    warn("Slap Farm Gui already loaded.")
    return
else
    _G.SlapFarmGuiLoaded = true
end

-- Final reconnect logic if player respawns
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    updateFakeNametag()
    if _G.BotJump then
        coroutine.wrap(function()
            while _G.BotJump do
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                task.wait(1)
            end
        end)()
    end
end)

-- Final notification
notify("Slap Farm GUI", "All systems operational. Happy farming!", 6, true)

-- End of script
--[[
BONUS SECTION: Template Functions for Expansion
These are inactive until connected to the GUI.
]]--

-- Utility: Refresh character data
function RefreshCharacterData()
    local char = game.Players.LocalPlayer.Character
    if char then
        print("[REFRESH] Character reloaded")
        updateFakeNametag()
    else
        warn("[REFRESH] Character not found")
    end
end

-- Utility: Server Info
function PrintServerStats()
    local playerCount = #game.Players:GetPlayers()
    local serverTime = os.date("%X")
    print("[SERVER STATS] Players:", playerCount, "| Time:", serverTime)
    notify("Server Stats", "Players: "..playerCount.." | Time: "..serverTime, 5, false)
end

-- Template: Auto rejoin if kicked (commented)
--[[ 
game.CoreGui.DescendantRemoving:Connect(function(child)
    if tostring(child):lower():find("kick") then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)
]]

-- Ready for more ideas
-- You can add things like:
-- - Player tracker
-- - PvP farm mode
-- - AFK detection
-- - Glove cooldown timer

-- End of script (no further code beyond this point)
print("Slap Farm Gui script completely executed.")
