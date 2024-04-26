--[[

███╗   ███╗████████╗██╗  ██╗     ██████╗██╗     ██╗███████╗███╗   ██╗████████╗
████╗ ████║╚══██╔══╝╚██╗██╔╝    ██╔════╝██║     ██║██╔════╝████╗  ██║╚══██╔══╝
██╔████╔██║   ██║    ╚███╔╝     ██║     ██║     ██║█████╗  ██╔██╗ ██║   ██║   
██║╚██╔╝██║   ██║    ██╔██╗     ██║     ██║     ██║██╔══╝  ██║╚██╗██║   ██║   
██║ ╚═╝ ██║   ██║   ██╔╝ ██╗    ╚██████╗███████╗██║███████╗██║ ╚████║   ██║   
╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝     ╚═════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝  

                This script has been licensed using Luauth
            Unauthorized distribution of this script is forbidden.
      Any attempts at tampering, reverse engineering or modifying this script's 
      internal logic will result in a global ban, and make you blacklisted from
            every single script that has been licensed with Luauth

        Luauth v2.5 for Roblox, #1 lua whitelisting system by Federal#9999

]]
local Settings = {}
repeat wait() until game.Players.LocalPlayer
if not getgenv().MTXClient then getgenv().MTXClient = {} end
for k,v in pairs(getgenv().MTXClient) do v.On = false end
local SaveManager = game.Players.LocalPlayer
local Settings = {}
function TableToSave(tb) 
    local cac = {}
    for k,v in pairs(tb) do
        if type(v)=="vector" then 
            cac[k]={v.X,v.Y,v.Z,"Vector3"}
        else
            cac[k]=v
        end
    end
    return cac
end
function SaveToTable(tb) 
    local cac = {}
    for k,v in pairs(tb) do
        if type(v)=="table" and #v==4 and v[4]=="Vector3" then 
            cac[k]=Vector3.new(v[1],v[2],v[3])
        else
            cac[k]=v
        end
    end
    return cac
end
local SaveFileName = SaveManager.Name.."_MTXClient.json"
function SaveSettings()
    local HttpService = game:GetService("HttpService")
    if not isfolder("MTX Client") then
        makefolder("MTX Client")
    end
    writefile("MTX Client/" .. SaveFileName, HttpService:JSONEncode(TableToSave(Settings)))
end
function ReadSetting() 
    local s,e = pcall(function() 
        local HttpService = game:GetService("HttpService")
        if not isfolder("MTX Client") then
            makefolder("MTX Client")
        end
        return HttpService:JSONDecode(readfile("MTX Client/" .. SaveFileName))
    end)
    if s then return e 
    else
        SaveSettings()
        return ReadSetting()
    end
end
local MTXClientDump = {On = true}
function MTXClientDump:cac(self) 
    spawn(function() 
        while wait(1) and self.On do SaveSettings() end
        print("Stoped")
    end)
end
MTXClientDump:cac(MTXClientDump)
table.insert(getgenv().MTXClient,MTXClientDump)
Settings = SaveToTable(ReadSetting())
repeat wait() until game:IsLoaded()

if not getgenv().Tasks then 
    getgenv().Tasks = {}
    Tasks.__index = Tasks
    
    function Tasks.new(name,func,Settings)
        if not Settings then Settings = {} else print(name)  end
        local obj = {
            Name = name,
            Function = func,
            Settings = Settings or {}
        }
        setmetatable(obj, Tasks)
        return obj
    end
    
    function Tasks:Stop() 
        if not self:IsRunning() then return end
        if self.Thread then 
            task.cancel(self.Thread)
        end
        if self.ForceStoped then 
            task.spawn(self.ForceStoped)
        end
    end
    function Tasks:Start() 
        if self:IsRunning() then return end
        self.Thread = task.spawn(self.Function)
        return self
    end
    
    function Tasks:IsRunning() 
        if not self.Thread then return false end
        return coroutine.status(self.Thread) ~= "dead"
    end
end

if not getgenv().ListTask then 
    getgenv().ListTask = {}
end

local TaskHandler = {}

function TaskHandler:AddTask(Name, func,Settings)
    ListTask[Name] = Tasks.new(name,func,Settings)
    return ListTask[Name]
end

function TaskHandler:StopTask(Name)
    if not ListTask[Name] then return end
    ListTask[Name]:Stop()
end

function TaskHandler:CancelAll()
    for k, v in (ListTask) do
        v:Stop()
    end
end
TaskHandler:CancelAll()

table.clear(getgenv().ListTask)
getgenv().ListTask = {}


local ListFeature = {}

local StateTable = {}

function SetFeatureState(Name,State,Check) 
    local Task = ListTask[Name]
    if Task then
        if Check then 
            if Check == "Settings" then 
                Settings[Name] = State
            end
            if not StateTable[Name] then 
                StateTable[Name] = {}
            end
            if State then
                local AnyStateEnabled 
                for k,v in StateTable[Name] do 
                    if v == true then 
                        AnyStateEnabled = true
                        break;
                    end
                end
                StateTable[Name][Check] = State
                if AnyStateEnabled or not Task:IsRunning() then 
                    Task:Start()
                end
            else
                StateTable[Name][Check] = State
                local AnyStateEnabled 
                for k,v in StateTable[Name] do 
                    if v == true then 
                        AnyStateEnabled = true
                        break;
                    end
                end
                if not AnyStateEnabled then 
                    Task:Stop()
                end
            end
        else
            Settings[Name] = State
            if State then 
                if not Task:IsRunning() then 
                    Task:Start()
                end
            else
                Task:Stop()
            end
        end
    end
end
function SetFeatureFunction(Name,func,Setting) 
    local Default = Settings[Name]
    local Task = TaskHandler:AddTask(Name,function() func(StateTable[Name]) end,Setting)
    ListFeature[Name] = Task
    if Default then 
        Settings[Name] = Default
        Task:Start()
    end
    return Task
end
