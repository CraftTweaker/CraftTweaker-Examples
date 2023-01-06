import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.replacement.Replacer;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.item.ItemDefinition;

//Replacer import is required for the static method.

//The Replacer 1.19.2 showcase.

Globals.startScript("replacer");

var oresTag as KnownTag<ItemDefinition>;
var axesTag as KnownTag<ItemDefinition>;

#snip modloader forge
oresTag = <tag:items:forge:ores>;
axesTag = <tag:items:forge:tools/axes>;
#snip end

#snip modloader fabric
oresTag = <tag:items:c:ores>;
axesTag = <tag:items:c:axes>;
#snip end


//Start the replacer.
Replacer.create()
    //Specify what to replace. We need to specify IIngredient in the <> because the type of the recipe component we're replacing (input/ingredients) is IIngredient.
    //And thus, we replace one IIngredient with another!
    .replace<IIngredient>(<recipecomponent:crafttweaker:input/ingredients>, oresTag.asIIngredient(), axesTag.asIIngredient())
    //Execute the replacer or else it won't do nothing.
    .execute();

Globals.endScript("replacer");    
