---[[ Loader Info ]]---
getgenv().Info = {
    ["Version"] = {
        Loader = {"0.1"}
    }
}

---[[ Variables ]]---
local WL = getgenv().Info.Version.Loader[1]
print(WL)
