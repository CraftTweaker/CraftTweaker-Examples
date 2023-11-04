import crafttweaker.api.item.IItemStack;

Globals.startScript("coloured_items");


//Globals.COLOURS contains a list of registered colours in game. Mods may add more (although this is prone to errors), 
//so be careful of that!

//This script showcases an intermediate level script, where loops and string interpolation are used to create
//complex recipes from a blueprint

for color in Globals.COLOURS {
    //For each colour, we create an array with 0 < n <= 9 coloured wool items.
    //With n being the length of the colour's name any underscores it might have
    var ingredient = new IItemStack[](9,<item:minecraft:air>);
    var position = 0;
    for i in 0 .. color.length {
        var letter = color[i];
        if (letter != "_") {
            ingredient[position] = <item:minecraft:${color}_wool>;
            ++position;
        }
    }
    //We then add a recipe with this array.
    craftingTable.addShaped(color + "_dye", <item:minecraft:${color}_dye>,[
        [ingredient[0], ingredient[1], ingredient[2]],
        [ingredient[3], ingredient[4], ingredient[5]],
        [ingredient[6], ingredient[7], ingredient[8]]
    ]);
}

Globals.endScript("coloured_items");
