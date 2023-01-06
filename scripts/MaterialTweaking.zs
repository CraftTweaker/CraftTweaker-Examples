//This script uses the Material class defined in scripts/classes/Material.zs to abstract out some logic and make scripts cleaner.

Globals.startScript("MaterialTweaking");

//Since we didn't specify a constructor for our class, we can create one using the default constructor found in all classes, with no arguments.
var stoneMat = new Material();
//We then specify the name and blockItem, vital properties of our Material class.
stoneMat.name = "CobbleStone";
stoneMat.blockItem = <item:minecraft:cobblestone>;
//Slab and stair are optional, but we WILL specify them.
stoneMat.slab = <item:minecraft:cobblestone_slab>;
stoneMat.stair = <item:minecraft:cobblestone_stairs>;
//Calling stoneMat.build calls Material#build, since it's an Instance method.
stoneMat.build();

Globals.endScript("MaterialTweaking");