
-- Custom 
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
-- Function will be called when the player overlaps the trigger.
local function OnBeginOverlap(trigger, obj)

        if not obj:IsA("Player") then return end
        
        Events.Broadcast("TransferScene", obj)

end

TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)