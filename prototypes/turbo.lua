local stack = 
{
  icon = "__ups-modules__/graphics/stacks.png",
  icon_size = 64,
  icon_mipmaps = 1,
  shift = { 8, -8 },
  scale = 0.25
}

local recipe_compression = 50

local get_turbo_ingredients = function()
  local ingredients = {}
  for ___, value in pairs({

  }) do table.insert({ name = value, type = "item", amount = 625 }) end
  return ingredients
end

data:extend({
  -- -- CATEGORY
  {
    type = "module-category",
    name = "turbo"
  },
  -- -- ITEM
  {
    type = "module",
    name = "turbo-module-1",
    localised_description = {"item-description.turbo-module-1"},
    icon = "__ups-modules__/graphics/turbo.png",
    icon_size = 128, 
    icon_mipmaps = 1,
    subgroup = "module",
    category = "turbo",
    tier = 1,
    order = "e[turbo]-a[turbo-module-1]",
    stack_size = 50,
    effect = 
    { 
      speed = { bonus = 135.0 }, 
      consumption = { bonus = 200.0 },
      productivity = { bonus = 0.01 }
    },
    limitation = 
    {
      "kr-bulk-hydrogen",
      "kr-bulk-oxygen",
      "kr-bulk-nitrogen",
      "kr-bulk-water-from-atmosphere",
    },
    limitation_message_key = "turbo",
    beacon_tint =
    {
      primary   = {r = 1, g = 0, b = 0, a = 1.000},
      secondary = {r = 1, g = 0, b = 0, a = 1.000},
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  {
    type = "fluid",
    name = "kr-compressed-air",
    default_temperature = 25,
    max_temperature = 100,
    auto_barrel = true,
    base_color = { r = 0.00, g = 0.00, b = 0.50 },
    flow_color = { r = 0.00, g = 0.00, b = 0.50 },
    gas_temperature = 25,
    icon = "__ups-modules__/graphics/kr-compressed-air.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "ya10[compressed-air]",
  },
  -- -- RECIPES
  -- item
  {
    type = "recipe",
    name = "turbo-module-1",
    category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
      {
        type = "fluid", 
        name = "kr-compressed-air", 
        amount = 25000  --250 * 3 air_types * 1000 = 750k air
      },
      {
        type = "item",
        name = "engine-unit",
        amount = 20
      }
    },
    energy_required = 60 * 60, --1h
    result = "turbo-module-1"
  },
  -- compressed air
  {
    type = "recipe",
    name = "kr-compressed-air",
    category = "atmosphere-condensation",
    order = "a[atmosphere-condensation]-b4[compressed-air]",
    always_show_made_in = true,
    always_show_products = true,
    hide_from_player_crafting = true,
    enabled = false,
    ingredients = {},
    energy_required = 900,
    results =
    {
      { 
        type = "fluid",
        name = "kr-compressed-air",
        amount = 1
      }
    },
    subgroup = "raw-material",
  },
  -- bulk recipes
  {
    name = "kr-bulk-hydrogen",
    type = "recipe",
    category = "atmosphere-condensation",
    order = "b[atmosphere-condensation]-a1[hydrogen]",
    subgroup = "raw-material",
    always_show_made_in = true,
    always_show_products = true,
    enabled = false,
    icons = 
    {
      {
        icon = "__Krastorio2Assets__/icons/fluids/hydrogen.png",
        icon_size = 64, 
        icon_mipmaps = 4,
      },
      table.deepcopy(stack),
    },
    hide_from_player_crafting = true,
    ingredients = {},
    results = {
      {
        amount = 30 * recipe_compression,
        name = "hydrogen",
        type = "fluid"
      }
    },
    energy_required = 20 * recipe_compression,
  },
  {
    name = "kr-bulk-oxygen",
    type = "recipe",
    category = "atmosphere-condensation",
    order = "b[atmosphere-condensation]-a2[oxygen]",
    subgroup = "raw-material",
    always_show_made_in = true,
    always_show_products = true,
    enabled = false,
    hide_from_player_crafting = true,
    icons = 
    {
      {
        icon = "__Krastorio2Assets__/icons/fluids/oxygen.png",
        icon_size = 64, 
        icon_mipmaps = 4,
      },
      table.deepcopy(stack),
    },
    ingredients = {},
    results = {
      {
        amount = 30 * recipe_compression,
        name = "oxygen",
        type = "fluid"
      }
    },
    energy_required = 5 * recipe_compression,
  },
  {
    name = "kr-bulk-nitrogen",
    type = "recipe",
    category = "atmosphere-condensation",
    order = "b[atmosphere-condensation]-a3[nitrogen]",
    subgroup = "raw-material",
    always_show_made_in = true,
    always_show_products = true,
    enabled = false,
    hide_from_player_crafting = true,
    icons = 
    {
      {
        icon = "__Krastorio2Assets__/icons/fluids/nitrogen.png",
        icon_size = 64, 
        icon_mipmaps = 4,
      },
      table.deepcopy(stack),
    },
    ingredients = {},
    results = {
      {
        amount = 30 * recipe_compression,
        name = "nitrogen",
        type = "fluid"
      }
    },
    energy_required = 30 * recipe_compression,
  },
  {
    name = "kr-bulk-water-from-atmosphere",
    type = "recipe",
    category = "atmosphere-condensation",
    order = "b[atmosphere-condensation]-a0[water]",
    subgroup = "raw-material",
    always_show_made_in = true,
    always_show_products = true,
    enabled = false,
    hide_from_player_crafting = true,
    icons = 
    {
      {
        icon = "__Krastorio2Assets__/icons/fluids/water.png",
        icon_size = 64, 
        icon_mipmaps = 4,
      },
      table.deepcopy(stack),
    },
    ingredients = {},
    results = {
      {
        amount = 30 * recipe_compression,
        name = "water",
        type = "fluid"
      }
    },
    energy_required = 10 * recipe_compression,
  },
  -- -- TECHNOLOGY
  {
    type = "technology",
    name = "kr-turbos",
    icons = {
      {
        icon_size = 256,
        icon_mipmaps = 4,
        icon = "__ups-modules__/graphics/technology/module-base.png",
      },
      {
        icon_size = 128,
        icon_mipmaps = 1,
        icon = "__ups-modules__/graphics/turbo.png",
        scale = 1,
        shift = {64, 64}
      }
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "turbo-module-1"
      },
      {
        type = "unlock-recipe",
        recipe = "kr-bulk-hydrogen"
      },
      {
        type = "unlock-recipe",
        recipe = "kr-bulk-oxygen"
      },
      {
        type = "unlock-recipe",
        recipe = "kr-bulk-nitrogen"
      },
      {
        type = "unlock-recipe",
        recipe = "kr-bulk-water-from-atmosphere"
      }
    },
    prerequisites = {"kr-advanced-tech-card", "space-science-pack", "kr-atmosphere-condensation"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"matter-tech-card", 1},
        {"advanced-tech-card", 1},
      },
      time = 60
    },
    upgrade = true,
    order = "i-c-c"
  },
})
