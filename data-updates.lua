-- add compressed air to K2's Adv. Chemistry
local kr_adv_chemistry = data.raw.technology["kr-advanced-chemistry"]
if kr_adv_chemistry and kr_adv_chemistry.effects then 
  table.insert(
    kr_adv_chemistry.effects,
    {
      type = "unlock-recipe",
      recipe = "kr-compressed-air"
    }
  )
end