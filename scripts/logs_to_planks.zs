import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.item.IItemStack;

//MultiLoader example!

/** 
* This example uses a Map or Associative Array. 
* For more information refer to the appropriate documentation page located here, under the ZenCode docs:
* https://docs.blamejared.com/1.20.1/en/zencode/AssociativeArrays
*/

Globals.startScript("logs_to_planks");

//Creates a map that links each log to each plank
//Essentially used like a list of pairs of values, rather than a key-value map.

val logs_to_planks as IItemStack[IItemStack] = {
  <item:minecraft:oak_log>: <item:minecraft:oak_planks>,
  <item:minecraft:spruce_log>: <item:minecraft:spruce_planks>,
  <item:minecraft:birch_log>: <item:minecraft:birch_planks>,
  <item:minecraft:jungle_log>: <item:minecraft:jungle_planks>,
  <item:minecraft:acacia_log>: <item:minecraft:acacia_planks>,
  <item:minecraft:dark_oak_log>: <item:minecraft:dark_oak_planks>
  //You can expand this with modded logs and planks or change it to something else.
};

//Both log and plank are IItemStacks within this loop.
for log, plank in logs_to_planks {
    //removes the plank recipes
   craftingTable.remove(plank);
   //Remakes the recipe with the conditions we want (in this case, you get a 2:1 plank to log ratio)
   craftingTable.addShapeless("log_to_planks_" + plank.registryName.path, plank * 2, [log]);
}

Globals.endScript("logs_to_planks");