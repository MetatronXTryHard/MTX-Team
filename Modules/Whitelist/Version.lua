---[[ Game Load Wait ]]---
if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

---[[ Loader Info ]]---
getgenv().Info = {
  ["Version"] = {Loader = {"0.1"}}
}

---[[ Loader Version Check ]]---
local function VersionCheck()
    if getgenv().Info and getgenv().Info.Version and getgenv().Info.Version.Loader then
        local version = getgenv().Info.Version.Loader[1]
    else
        print("Loader Version information not found.")
    end
end
VersionCheck()
