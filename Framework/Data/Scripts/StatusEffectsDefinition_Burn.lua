-- Module dependencies
local MODULE = require(script:GetCustomProperty("ModuleManager"))
function COMBAT()
	return MODULE:Get("standardcombo.Combat.Wrap")
end
 
local dmg = Damage.New()

function EffectTick(player, source, damage)
	dmg.amount = damage or DEFAULT_DPS
	dmg.reason = DamageReason.COMBAT
	local attackData = {
		object = player,
		damage = dmg,
		source = nil,
		position = nil,
		rotation = nil,
		tags = {id = "StatusEffect", name = "Burn"}
	}
	COMBAT().ApplyDamage(attackData)

end

return EffectTick
--[[

	local data = {}
	
	data.name = "Burn"
	data.duration = 5.0
	data.icon = EFFECT_ICON
	data.color = Color.RUBY
	data.effectTemplate = EFFECT_TEMPLATE
	data.type = API_SE.STATUS_EFFECT_TYPE_CUSTOM
	data.tickFunction = EffectTick
	
	API_SE.DefineStatusEffect(data)
]]
