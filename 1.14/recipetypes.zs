<recipetype:blasting>.removeRecipe(<item:minecraft:gold_ingot>);
<recipetype:smoking>.removeRecipe(<item:minecraft:cooked_beef>);

<recipetype:smoking>.removeAll();


campfire.addRecipe("wood2coal", <item:minecraft:charcoal>, <tag:minecraft:logs>, 20, 20);

<recipetype:smoking>.addJSONRecipe("test_recipes",
{
	ingredient: {
		item: <item:minecraft:gold_ore>.registryName
	},
	result: <item:minecraft:cooked_porkchop>.registryName,
	experience: 0.35 as float,
	cookingtime: 100
});
