getgenv().Info = {
  ["Version"] = {Loader = {"0.1"}
}
local function printLoaderVersion()
    if getgenv().Info and getgenv().Info.Version and getgenv().Info.Version.Loader then
        local version = getgenv().Info.Version.Loader[1]
        print("Loader Version: " .. version)
    else
        print("Loader Version information not found.")
    end
end
  
printLoaderVersion()
return VersionData
