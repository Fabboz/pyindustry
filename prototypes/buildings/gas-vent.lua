local Recipe = require("stdlib/data/recipe")
local Pipes = require("stdlib.data.pipes")

local recipe = Recipe {
    type = "recipe",
    name = "py-gas-vent",
    energy_required = 5,
    enabled = true,
    ingredients = {
        {"iron-plate", 20},
		{"pipe", 15},
        {"stone-brick", 5}
    },
    result = "py-gas-vent"
}

local item = {
    type = "item",
    name = "py-gas-vent",
    icon = "__pyindustry__/graphics/icons/py-gas-vent.png",
    flags = {"goes-to-quickbar"},
    subgroup = "py-industry",
    order = "a",
    place_result = "py-gas-vent",
    stack_size = 10
}

local entity =
    {
    type = "assembling-machine",
    name = "py-gas-vent",
    icon = "__pyindustry__/graphics/icons/py-gas-vent.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "py-gas-vent"},
    max_health = 400,
    corpse = "medium-remnants",
    repair_sound = {filename = "__base__/sound/manual-repair-simple.ogg"},
    mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg"},
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
    vehicle_impact_sound = {filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0},
    module_specification = {
        module_slots = 6
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    working_sound = {
        sound = {filename = "__base__/sound/idle1.ogg", volume = 0.7},
        idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.4},
        apparent_volume = 1.0
    },
    resistances = {
        {
            type = "fire",
            percent = 90
        },
        {
            type = "explosion",
            percent = 30
        },
        {
            type = "impact",
            percent = 30
        }
    },
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    crafting_categories = {"chemistry"},
    energy_usage = "1kW",
	ingredient_count = 2,
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.0
        },
    animation = {
	layers =
    {
            {
                filename = "__pyindustry__/graphics/entity/py-gas-vent/py-gas-vent.png",
                priority = "extra-high",
                width = 32,
                height = 192,
                frame_count = 1,
                shift = {0.0, -2.5},
                hr_version = {
                    filename = "__pyindustry__/graphics/entity/py-gas-vent/hr-py-gas-vent.png",
                    priority = "extra-high",
                    width = 64,
                    height = 384,
                    frame_count = 1,
                    shift = {0.0, -2.5},
                    scale = 0.5
                }
            },
            {
                filename = "__pyindustry__/graphics/entity/py-gas-vent/shadow.png",
                priority = "extra-high",
                width = 75,
                height = 23,
                frame_count = 1,
                draw_as_shadow = true,
                shift = {1.3, -0.0},
                hr_version = {
                    filename = "__pyindustry__/graphics/entity/py-gas-vent/hr-shadow.png",
                    priority = "extra-high",
                    width = 150,
                    height = 46,
                    frame_count = 1,
					draw_as_shadow = true,
                    shift = {1.3, -0.0},
                    scale = 0.5
                }				
            },
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = Pipes.pictures("assembling-machine-3", nil, nil, nil, nil),
            pipe_covers = Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {1.0, 0.0}}}
        },
        {
            production_type = "input",
            pipe_picture = Pipes.pictures("assembling-machine-3", nil, nil, nil, nil),
            pipe_covers = Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-1.0, 0.0}}}
        },
        {
            production_type = "input",
            pipe_picture = Pipes.pictures("assembling-machine-3", nil, nil, nil, nil),
            pipe_covers = Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 1.0}}}
        },
        {
            production_type = "input",
            pipe_picture = Pipes.pictures("assembling-machine-3", nil, nil, nil, nil),
            pipe_covers = Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -1.0}}}
        },
        off_when_no_fluid_recipe = false
    },
    fast_replaceable_group = "py-gas-vent",
}
data:extend {recipe, item, entity}