local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = ReplicatedStorage.Knit
local Signal = require(Knit.Util.Signal)

-- Handles object placement for players
local PlacementService = Knit.CreateService {
    Name = "PlacementService",
    Client = {}
}

-- Variables
PlacementService.BaseParts = {} -- player, Part

-- Events
PlacementService.InvokePlacement = Signal.new()

-- Initalize player connection to PlacementService
function PlacementService.Init(player, basePart)
    PlacementService.BaseParts[player] = basePart

    local baseObjects = Instance.new("Folder")
    baseObjects.Name = "BaseObjects"
    baseObjects.Parent = basePart
end

function PlacementService.GetBasePart(player)
    return PlacementService.BaseParts[player]
end

return PlacementService