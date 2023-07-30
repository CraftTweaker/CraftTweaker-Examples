import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.world.Container;

Globals.startScript("recipe_looping");

//This script showcases how to loop over a recipetypes recipes. For mods, if you have the specific class available to you (through a mod) then cast to that.

//Remember, the furnace and other global keywords are just global variables for the <recipetype> brackets. They are interchangeable.

//Also, keep in mind that mods are not required to return valid information in Recipe objects. The id will always be valid, but a mod like Mekanism may have recipes with
//no ingredients or outputs, as they may be using fluids. Be careful of that!

//Some of the operations you might be able to think of when doing this, like removing all recipes with a certain input, output, or under a certain namespace, may
//already be implemented as an IRecipeManager method. Make sure to check those out!

//This cast is required!    
val furnaceRecipes = furnace.getAllRecipes() as stdlib.List<Recipe<Container>>;
for recipe in furnaceRecipes {
    if (!recipe.group.empty) {
        println("> " + recipe.id);
    }
}

Globals.endScript("recipe_looping");