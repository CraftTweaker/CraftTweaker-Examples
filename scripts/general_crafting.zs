//No imports required unless you're making a recipe function!


Globals.startScript("general_crafting");

//Shotgun approach, removes ALL recipes that output TNT in the Crafting Table.
craftingTable.remove(<item:minecraft:tnt>);

//Scalpel approach, only removes the specified recipe and not any more.
stoneCutter.removeByName("minecraft:cut_copper_stairs_from_cut_copper_stonecutting");
stoneCutter.removeByName("minecraft:cut_copper_stairs_from_copper_block_stonecutting");

//Reverse lookup. Also shotgun approach.
furnace.removeByInput(<item:minecraft:raw_iron>);

//Keep in mind remove and removeByInput may or may not work for modded recipes.

//Vanilla Recipes always have Item inputs and Item outputs, but modded recipes do not have to abide by that.

//So what is our lesson here? 
//If you want to remove modded recipes, removeByName will always work and never give you up, while the others, may let you down, run around, and desert you.


Globals.endScript("general_crafting");