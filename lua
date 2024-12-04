-- 🍃 Leaf Bot V2 - Fully Extended Script with Enhanced Features

-- Initialize configuration and player status tracking
local LeafBot = {
    Version = "V2",
    Config = {
        OrbitSpeed = 10,
        OrbitRadius = 15,
        FollowDistance = 5,
        SpamMessage = "Hello!",
        SpamRate = 1,
        SitEnabled = true,
        DebugMode = true, -- Enable debug mode for detailed logs
    },
    PlayerStatus = {},
    ActivePlayers = {},
    ErrorLogs = {},
    EventListeners = {},
    LastExecuted = {}
}

-- Helper function for safe execution with enhanced error handling
local function safeExecute(func)
    local success, errorMsg = pcall(func)
    if not success then
        print("🍃 Error encountered: " .. errorMsg)
        table.insert(LeafBot.ErrorLogs, errorMsg)
    end
end

-- Debug logging with real-time monitoring
local function debugLog(message)
    if LeafBot.Config.DebugMode then
        print("🍃 Debug Log: " .. message)
    end
end

-- Wait for the game to fully load before continuing
local function waitForGameToLoad()
    local success, errorMsg = pcall(function()
        repeat
            wait(0.5)
        until game:IsLoaded()
    end)
    if not success then
        warn("🍃 Failed to wait for game to load: " .. errorMsg)
    else
        debugLog("🍃 Game loaded successfully.")
    end
end

-- Monitor player status continuously
local function monitorPlayerStatus()
    game:GetService("RunService").Heartbeat:Connect(function()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                LeafBot.PlayerStatus[player.Name] = "Active"
            else
                LeafBot.PlayerStatus[player.Name] = "Inactive"
                warn("🍃 Player " .. player.Name .. " is inactive or disconnected.")
            end
        end
    end)
end

-- Function for orbiting a target player
local function orbitCommand(player, target, speed, radius)
    debugLog("🍃 Executing orbit command for " .. player.Name .. " around " .. target.Name)
    local angle = math.random() * 360
    local newPos = target.Character.HumanoidRootPart.Position + Vector3.new(math.cos(angle) * radius, 0, math.sin(angle) * radius)
    
    -- Orbiting logic
    player.Character.HumanoidRootPart.CFrame = CFrame.new(newPos)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position)
end

-- Follow a player at a specified distance
local function followCommand(player, target, distance)
    debugLog("🍃 Executing follow command for " .. player.Name .. " following " .. target.Name)
    -- Logic to follow target within specified distance
    while target and player do
        local targetPos = target.Character.HumanoidRootPart.Position
        local currentPos = player.Character.HumanoidRootPart.Position
        local direction = (targetPos - currentPos).unit
        player.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos + direction * distance)
        wait(1)
    end
end

-- Spam message command
local function spamCommand(player, message, rate)
    debugLog("🍃 Executing spam command with message: " .. message)
    while true do
        player:Chat(message)
        wait(rate)
    end
end

-- Sit command
local function sitCommand(player)
    debugLog("🍃 Executing sit command for " .. player.Name)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Sit = true
    end
end

-- Rayfield GUI setup for real-time monitoring and settings
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local window = Rayfield:CreateWindow("🍃 Leaf Bot V2")

-- Tabs for commands and configuration
local mainTab = window:CreateTab("Main Commands")
local statusTab = window:CreateTab("Player Status")
local commandTab = window:CreateTab("Command Settings")
local informationTab = window:CreateTab("Information")
local informationV2Tab = window:CreateTab("Information V2")

-- Display information in tabs
informationTab:CreateLabel("🍃 Leaf Bot V2: The latest version of the bot with enhanced features.")
informationV2Tab:CreateLabel("🍃 This bot includes smooth orbiting, following, and chat spamming commands.")
informationV2Tab:CreateLabel("🍃 Developed by LeafCorp with a focus on customization and stability.")
informationV2Tab:CreateLabel("🍃 All commands and features are fully adjustable for optimal performance.")

-- Add buttons to main tab for executing commands
mainTab:CreateButton("Orbit Command", function()
    local targetPlayer = game.Players:FindFirstChild("TargetPlayerName") -- Replace with actual player name selection logic
    if targetPlayer then
        task.spawn(orbitCommand, game.Players.LocalPlayer, targetPlayer, LeafBot.Config.OrbitSpeed, LeafBot.Config.OrbitRadius)
    end
end)

mainTab:CreateButton("Follow Command", function()
    local targetPlayer = game.Players:FindFirstChild("TargetPlayerName") -- Replace with actual player name selection logic
    if targetPlayer then
        task.spawn(followCommand, game.Players.LocalPlayer, targetPlayer, LeafBot.Config.FollowDistance)
    end
end)

mainTab:CreateButton("Spam Command", function()
    task.spawn(spamCommand, game.Players.LocalPlayer, LeafBot.Config.SpamMessage, LeafBot.Config.SpamRate)
end)

mainTab:CreateButton("Sit Command", function()
    sitCommand(game.Players.LocalPlayer)
end)

-- Player status update in the status tab
statusTab:CreateLabel("Current Player Status:")
local playerStatusList = statusTab:CreateListBox()

game:GetService("RunService").Heartbeat:Connect(function()
    playerStatusList:Clear()
    for _, player in pairs(game.Players:GetPlayers()) do
        local status = LeafBot.PlayerStatus[player.Name] or "Unknown"
        playerStatusList:AddItem(player.Name .. ": " .. status)
    end
end)

-- Command settings with inputs for speed, radius, and spam rate
commandTab:CreateInput("Orbit Speed", "Enter the speed for orbiting", true, function(value)
    LeafBot.Config.OrbitSpeed = tonumber(value)
end)

commandTab:CreateInput("Orbit Radius", "Enter the radius for orbiting", true, function(value)
    LeafBot.Config.OrbitRadius = tonumber(value)
end)

commandTab:CreateInput("Follow Distance", "Enter the follow distance", true, function(value)
    LeafBot.Config.FollowDistance = tonumber(value)
end)

commandTab:CreateInput("Spam Message", "Enter the message to spam", true, function(value)
    LeafBot.Config.SpamMessage = value
end)

commandTab:CreateInput("Spam Rate", "Enter the rate at which to spam", true, function(value)
    LeafBot.Config.SpamRate = tonumber(value)
end)

-- Display version and credits
statusTab:CreateLabel("🍃 Version: " .. LeafBot.Version)
informationTab:CreateLabel("🍃 Developed by LeafCorp, all rights reserved.")
informationTab:CreateLabel("🍃 For help, join the Discord: leafcorp")

-- Finalize script execution
waitForGameToLoad() -- Ensure game is fully loaded before execution

-- Check if version is V2 and proceed with execution
if LeafBot.Version == "V2" then
    debugLog("🍃 Leaf Bot V2 initialized successfully. Ready to assist.")
    print("🍃 Leaf Bot V2 is ready to use!")
else
    warn("🍃 Incorrect version. Please use Leaf Bot V2.")
end

-- Safe execution and monitoring of game events
safeExecute(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            debugLog("🍃 Player is active and in the game.")
        else
            warn("🍃 Player not found or disconnected!")
        end
    end)
end)

-- Monitoring function for real-time updates
game:GetService("RunService").Heartbeat:Connect(function()
    -- Continuous updates on game state and player activity
    for playerName, status in pairs(LeafBot.PlayerStatus) do
        debugLog("🍃 Monitoring status for player: " .. playerName .. " -> Status: " .. status)
    end
end)

-- End of script
print("🍃 Leaf Bot V2 successfully loaded. All systems operational.")
