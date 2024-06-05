---[[ Game Load Wait ]]---
if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

---[[ Loader Info ]]---
getgenv().Info = {["Version"] = {Loader = {"0.1"}}}
