import crafttweaker.api.recipe.MirrorAxis;

Globals.startScript("crafting_table_in_depth");

craftingTable.addShapedMirrored("shaped_mirror_example_1", MirrorAxis.DIAGONAL, <item:minecraft:arrow> * 2, [
    [<item:minecraft:diamond>, <item:minecraft:diamond>],
    [<item:minecraft:air>, <item:minecraft:flint>],
    [<item:minecraft:air>, <item:minecraft:flint>]
]);

Globals.endScript("crafting_table_in_depth");
