-- Custom 
local SCENE = script:GetCustomProperty("Scene")

local function TransferScene(player)

        -- Transfer the player to the scene, and set the spawn point.
        print("Scene: ", SCENE)
       -- if Game.GetCurrentSceneName() == "Shark" then
                player:TransferToScene(SCENE, { spawnKey = "" })
       -- end

end

Events.Connect("TransferScene", TransferScene)