#modloaded create 
#modloader forge

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;
import crafttweaker.api.util.random.Percentaged;

//Preprocessor for the sake of the examples repository, so you can download it without requiring all mods!
//The modloaded preprocessor only loads the script if the provided modid argument is loaded in the game.

//The modloade*R* preprocessor only loads the script in the provided ModLoader. In this case, Forge, as the creator of the script has not tested it in Fabric
//and has suspicions it will not be a 1:1 conversion.
//(If you've been paying attention, you'll know that this means that essentially, CraftTweaker scripts work on multiple loaders, unless they touch specific things.
//Cool thing huh?

//The imports are ONLY used for casts. That's why they're required.

/*

This script showcases how to add a JSON Recipe for Create's Cutting machine.

There are two versions of it, the basic one, and the function one.

As you might be able to tell, the goal of the function one is to make a more compact and easy to use script, at a more complex script, 
and of course requiring a bit more of coding knowledge.

Supporting NBT and other additionals is dependant on the mod you're trying to modify.
*/

Globals.startScript("create_cutting_json");

//Standard Recipe addition, hardcoded json contents.
<recipetype:create:cutting>.addJsonRecipe("diamond_hoe_reusing", {
  "type": "create:cutting",
  "ingredients": [
    {
      "item" : "minecraft:diamond_hoe"
    }
  ],
  "results": [
    {
      "item" : "minecraft:diamond"
    }
  ],
  "processingTime": 10
}
);

//Dynamic, works for the inputs and outputs you specify.

//You can create a Percentaged<IItemStack> by using:

// IItemStack % chanceOutOf100

// A Percentaged<T> is a Generic Object that combines the object with a percentage.
//In this case, we're using it to store the chance of an output. There is no guarantee (object % chance) will work for other Percentaged types.

//The name of the recipe must be unique, and it must abide by typical a-z0-9.-_/ restrictions.
function addCreateCutting(itemIn as IIngredient, itemOut as Percentaged<IItemStack>, duration as int) as void {
val internalItem = itemOut.getData();    
<recipetype:create:cutting>.addJsonRecipe("custom_cutting_recipe_" + duration + "_" + internalItem.descriptionId, {
  "type": "create:cutting",
  "ingredients": [
    itemIn as IData,
  ],
  "results": [
    (internalItem as IData).merge({"count" : internalItem.amount}).merge({"chance" : itemOut.getPercentage()})
  ],
  "processingTime": duration
}
);
}

//As said before, <item:minecraft:stick> * 2 is an IItemStack, and calling IItemStack % chanceOutOf100 returns a valid Percentaged<IItemStack>.

addCreateCutting(<tag:items:minecraft:planks>, <item:minecraft:stick> * 2 % 50, 200);


Globals.endScript("create_cutting_json");