
local icon = {
	"GFX_ship_part_computer_tank_basic",
	"GFX_ship_part_computer_tank_advanced",
	"GFX_ship_part_computer_tank_super"
}

local tech = {
	"tech_combat_computers_1",
	"tech_combat_computers_2",
	"tech_combat_computers_3"
}

local defaults = {
	upkeep = 0.2,
	evasion = 0,
	evasion_add = 20,
	combat_speed = 2.55,
	damage = 0.25,
	firerate = 0,
	armor = 0.35,
	regen_hull = 0.35,
	regen_shield = 0,
	regen_shield_mult = 0,
	hullpoints = 1.5,
	shields = 1.5,
	power = -50,
	power_step = 10,
	cost = 2000,

	behavior = "behavior_tank_battleship",
	size = "battleship",

	-- set these per level per ship
	key_prefix = "COMPUTER_FOLK_BATTLESHIP_",
	key = "",
	upgrade = "",
	icon = "",
	prereq = "",

	-- AI use weight, starts at this
	-- and decreases
	weight = 1000,

	-- Weights
	corvette = 6000,
	destroyer = 7000,
	cruiser = 8000,
	battleship = 9000,
	titan = 10000,
	leviathan = 11000,
	rs_battlecruiser = 8500,
	rs_dreadnought = 9500,
	rs_heavy_dreadnought = 9750,
	rs_ea_cruiser = 7500,
	rs_support_cruiser = 7200,
	frigate = 7100,
	lightcarrier = 8100,
	strikecruiser = 8800,
	carrier = 9500,
	dreadnought = 9750,
	commanddreadnought = 10000,
}
local ship = {
	mt = {
		__index = function(_, k)
			return defaults[k]
		end
	}
}
function ship.new(t)
	setmetatable(t, ship.mt)
	return t
end
--ship.mt

local template = [[
utility_component_template = {
	key = "[key]"
	size = small
	icon = "[icon]"
	icon_frame = 1
	power = [power]
	cost = [cost]
	class_restriction = { shipclass_military }
	size_restriction = { [size] }
	component_set = "combat_computers"
	ship_behavior = "[behavior]"
	prerequisites = { "[prereq]" }
	upgrades_to = "[upgrade]"
	ship_modifier = {
		ship_weapon_damage = [damage]
		ship_fire_rate_mult = [firerate]
	}
	modifier = {
		ship_upkeep_mult = [upkeep]
		ship_evasion_mult = [evasion]
		ship_combat_speed_mult = [combat_speed]
		ship_evasion_add = [evasion_add]

		ship_hitpoints_mult = [hullpoints]
		ship_shield_hp_mult = [shields]
		ship_armor_mult = [armor]
		ship_auto_repair_add = [regen_hull]
		ship_shield_regen_add = [regen_shield]
		ship_shield_regen_mult = [regen_shield_mult]
	}
	# Prevent us from getting the effect of other support auras I guess?
	# At least we tried.
	friendly_aura = {
		name = "tank_aura"
		radius = 1
		apply_on = ships
		stack_info = {
			id = friendly_support_aura
			priority = 100
		}
	}
	target_weights = {
		corvette = [corvette]
		destroyer = [destroyer]
		cruiser = [cruiser]
		battleship = [battleship]
		titan = [titan]
		leviathan = [leviathan]
		rs_battlecruiser = [rs_battlecruiser]
		rs_dreadnought = [rs_dreadnought]
		rs_heavy_dreadnought = [rs_heavy_dreadnought]
		rs_heavy_dreadnought_type_a = [rs_heavy_dreadnought]
		rs_heavy_dreadnought_type_b = [rs_heavy_dreadnought]
		rs_heavy_dreadnought_type_c = [rs_heavy_dreadnought]
		rs_heavy_dreadnought_type_d = [rs_heavy_dreadnought]
		rs_heavy_dreadnought_type_e = [rs_heavy_dreadnought]
		rs_heavy_dreadnought_type_f = [rs_heavy_dreadnought]
		rs_heavy_dreadnought_type_g = [rs_heavy_dreadnought]
		rs_ea_cruiser = [rs_ea_cruiser]
		rs_support_cruiser = [rs_support_cruiser]
		Frigate = [frigate]
		LightCarrier = [lightcarrier]
		StrikeCruiser = [strikecruiser]
		Battlecruiser = [rs_battlecruiser]
		Carrier = [carrier]
		Dreadnought = [dreadnought]
		Superdreadnought = [commanddreadnought]
	}
	ai_weight = {
		weight = 0
	}
}
]]

local function downOne(s)
	s.hullpoints = s.hullpoints - 0.25
	s.shields = s.shields - 0.25
	s.cost = 100 * math.floor(((s.cost * 0.75) + 50) / 100)
	s.power = s.power + s.power_step
	s.firerate = s.firerate - 0.1
	s.weight = s.weight - 1
end

-- name becomes the filename only
local function parseship(name, s)
	-- God dammit we need to write the computers out in 1-3 order
	-- And if we process it from 1-3, we need to start our calculations from
	-- level 1, and I dont care about 1 and 2.
	local tbl = {}
	for i = 3, 1, -1 do
		local tmp = template
		s.upgrade = s.key
		s.key = s.key_prefix .. tostring(i)
		s.icon = icon[i]
		s.prereq = tech[i]
		for k in pairs(defaults) do
			tmp = tmp:gsub("%[" .. k .. "%]", s[k])
		end
		tbl[i] = tmp
		downOne(s)
	end
	local fmt = "../common/component_templates/tanks_%s.txt"
	local f = io.open(fmt:format(name), "w+")
	f:write(tbl[1])
	f:write(tbl[2])
	f:write(tbl[3])
	f:close()
	-- yay floating tbl reference in the wind, have a nice trip
end

do -- lulz all battleship values are same as defaults
	local battleship = ship.new({})
	parseship("battleship", battleship)
end

do
	local cruiser = ship.new({
		upkeep = 0.5,
		combat_speed = 0.95,
		damage = 0,
		firerate = -0.6,

		armor = 1,
		regen_hull = 0.45,
		hullpoints = 1.25,
		shields = 1.75,
		power = -45,
		cost = 800,

		behavior = "behavior_tank_cruiser",
		key_prefix = "COMPUTER_FOLK_CRUISER_",
		size = "cofh_se_cruiser_hvy cruiser rs_battlecruiser Battlecruiser",
	})
	parseship("cruiser", cruiser)
end

do
	local destroyer = ship.new({
		upkeep = 0.5,
		evasion_add = 30,
		combat_speed = 0.95,
		damage = 0,
		firerate = -0.55,
		armor = 1.8,
		regen_hull = 0.40,
		hullpoints = 1.25,
		shields = 1.25,
		power = -30,
		power_step = 5,
		cost = 400,

		behavior = "behavior_tank_destroyer",
		key_prefix = "COMPUTER_FOLK_DESTROYER_",
		size = "cofh_se_destroyer_hvy destroyer Frigate",
	})
	parseship("destroyer", destroyer)
end

do
	local dreadnought = ship.new({
		evasion_add = 0,
		combat_speed = 5.4,
		damage = 0,
		firerate = -0.5,
		armor = 0.3,
		regen_hull = 0.4,
		hullpoints = 1.25,
		shields = 1.25,
		power = -70,
		cost = 2500,

		behavior = "behavior_tank_dreadnought",
		key_prefix = "COMPUTER_FOLK_DREADNOUGHT_",
		size = "Dreadnought rs_dreadnought"
	})
	parseship("dreadnought", dreadnought)
end

do
	local heavydread = ship.new({
		evasion_add = 0,
		combat_speed = 9.6,
		damage = 0,
		firerate = 0,
		armor = 0.25,
		regen_hull = 0.8,
		hullpoints = 1.25,
		shields = 1.25,
		power = -100,
		cost = 3000,

		behavior = "behavior_tank_heavy",
		key_prefix = "COMPUTER_FOLK_HEAVY_",
		size = "rs_heavy_dreadnought rs_heavy_dreadnought_type_a rs_heavy_dreadnought_type_b rs_heavy_dreadnought_type_c rs_heavy_dreadnought_type_d rs_heavy_dreadnought_type_e rs_heavy_dreadnought_type_f rs_heavy_dreadnought_type_g",
	})
	parseship("heavydread", heavydread)
end
