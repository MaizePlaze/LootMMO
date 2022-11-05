
-- Custom 
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
-- Function will be called when the player overlaps the trigger.
local function OnInteracted(trigger, obj)

        Events.Broadcast("TransferScene", obj)

end

TRIGGER.interactedEvent:Connect(OnInteracted)