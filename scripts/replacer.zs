import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.replacement.Replacer;

//Replacer import is required for the static method.

//The Replacer 1.19.2 showcase.

Globals.startScript("replacer");

//Start the replacer.
Replacer.create()
    //Specify what to replace. We need to specify IIngredient in the <> because the type of the recipe component we're replacing (input/ingredients) is IIngredient.
    //And thus, we replace one IIngredient with another!
    .replace<IIngredient>(<recipecomponent:crafttweaker:input/ingredients>, <tag:items:forge:ores>.asIIngredient(), <tag:items:forge:tools/axes>.asIIngredient())
    //Execute the replacer or else it won't do nothing.
    .execute();

Globals.endScript("replacer");    
