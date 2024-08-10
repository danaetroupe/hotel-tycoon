local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = ReplicatedStorage.Knit
local Signal = require(Knit.Util.Signal)

-- Handles grid functionality
local FloorService = Knit.CreateService {
    Name = "FloorService",
    Client = {}
}

-- Events

-- Initalizes grid system -> None
function FloorService.Init(player, basePart)
    local grid = ReplicatedStorage:FindFirstChild("Furniture"):FindFirstChild("GridSystem")
    if not grid then 
        error("Was unable to locate GridSystem in ReplicatedStorage") 
    end
    local square = grid:FindFirstChild("Frame"):FindFirstChild("Square")
    if not square then
        error ("Was unable to locate Square in GridSystem")
    end
    
    -- Initalize server grid
    grid = grid:Clone()
    grid.Adornee = basePart
    grid.Parent = basePart
    
    -- Initalize client grid
    local clientGrid = grid:Clone()
    clientGrid.Adornee = basePart
    clientGrid.Parent = player.PlayerGui

    for i = 0, (basePart.Size.X*basePart.Size.Z), 16 do
        square:Clone().Parent = grid:FindFirstChild("Frame")
        square:Clone().Parent = clientGrid:FindFirstChild("Frame")
    end

    -- Hide client grid
    clientGrid.Enabled = false
end
 
-- Returns client grid GUI
function FloorService.GetClientGrid(player)
    return player.PlayerGui:FindFirstChild("GridSystem")
end

-- Returns server grid GUI

return FloorService