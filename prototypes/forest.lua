local stack = 
{
  icon = "__ups-modules__/graphics/stacks.png",
  icon_size = 64,
  icon_mipmaps = 1,
  shift = { 8, -8 },
  scale = 0.25
}

local recipe_compression = 50

local get_forest_ingredients = function()
  local ingredients = {}
  for ___, value in pairs({
    "dead-dry-hairy-tree",
    "dead-grey-trunk",
    "dead-tree-desert",
    "dry-hairy-tree",
    "dry-tree",
    "tree-01",
    "tree-02",
    "tree-02-red",
    "tree-03",
    "tree-04",
    "tree-05",
    "tree-06",
    "tree-06-brown",
    "tree-07",
    "tree-08",
    "tree-08-red",
    "tree-08-brown",
    "tree-09",
    "tree-09-red",
    "tree-09-brown"
  }) do table.insert(ingredients, { name = value, type = "item", amount = 625 }) end
  return ingredients
end

data:extend({
  -- -- CATEGORY
  {
    type = "module-category",
    name = "forest"
  },
  -- -- ITEM
  {
    type = "module",
    name = "forest-module-1",
    icon = "__ups-modules__/graphics/forest.png",
    icon_size = 128, 
    icon_mipmaps = 1,
    subgroup = "module",
    category = "forest",
    tier = 1,
    order = "d[forest]-a[forest-module-1]",
    stack_size = 50,
    effect = 
    { 
      speed = {bonus = 135.0 }, 
      consumption = {bonus = 200.0 },
      productivity = {bonus = 0.01 }
    },
    limitation = 
    {
      "kr-bulk-grow-wood-plus", 
      "kr-bulk-grow-wood-with-water"
    },
    limitation_message_key = "forest",
    beacon_tint =
    {
      primary   = {r = 0, g = 1, b = 0, a = 1.000},
      secondary = {r = 0, g = 1, b = 0, a = 1.000},
    },
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
  -- -- RECIPES
  -- item
  {
    type = "recipe",
    name = "forest-module-1",
    enabled = false,
    ingredients = get_forest_ingredients(), --20 x 625 x 40 wood = 500k wood
    energy_required = 60 * 60, --1h
    result = "forest-module-1"
  },
  -- bulk recipes
  {
    name = "kr-bulk-grow-wood-plus",
    type = "recipe",
    category = "growing",
    order = "b[wood]",
    enabled = false,
    icons = 
    {
      {
        icon = "__Krastorio2Assets__/icons/recipes/wood-plus.png",
        icon_size = 64,
        icon_mipmaps = 1
      },
      table.deepcopy(stack),
    },
    ingredients = {
      {
        amount = 200 * recipe_compression,
        name = "water",
        type = "fluid"
      },
      {
        amount = 1 * recipe_compression,
        name = "fertilizer"
      }
    },
    result = "wood",
    result_count = 80 * recipe_compression,
    energy_required = 60 * recipe_compression,
  },
  {
    name = "kr-bulk-grow-wood-with-water",
    type = "recipe",
    category = "growing",
    order = "b[wood]",
    enabled = false,
    icons = 
    {
      {
        icon = "__base__/graphics/icons/wood.png",
        icon_size = 64, 
        icon_mipmaps = 4,
      },
      table.deepcopy(stack),
    },
    ingredients = {
      {
        amount = 200 * recipe_compression,
        name = "water",
        type = "fluid"
      }
    },
    result = "wood",
    result_count = 40 * recipe_compression,
    energy_required = 60 * recipe_compression,
  },
  -- -- TECHNOLOGY
  {
    type = "technology",
    name = "kr-forests",
    icons = {
      {
        icon_size = 256,
        icon_mipmaps = 4,
        icon = "__ups-modules__/graphics/technology/module-base.png",
      },
      {
        icon_size = 128,
        icon_mipmaps = 1,
        icon = "__ups-modules__/graphics/tree.png",
        scale = 1,
        shift = {64, 64}
      }
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "forest-module-1"
      },
      {
        type = "unlock-recipe",
        recipe = "kr-bulk-grow-wood-plus"
      },
      {
        type = "unlock-recipe",
        recipe = "kr-bulk-grow-wood-with-water"
      }
    },
    prerequisites = {"kr-advanced-tech-card", "space-science-pack", "kr-decorations"},
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