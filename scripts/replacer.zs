import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.replacement.Replacer;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.item.ItemDefinition;

//Replacer import is required for the static method.

//The Replacer 1.19.2 showcase.

Globals.startScript("replacer");

var oresTag as KnownTag<ItemDefinition>;
var axesTag as KnownTag<ItemDefinition>;

#onlyIf modloader forge
oresTag = <tag:items:forge:ores>;
axesTag = <tag:items:minecraft:axes>;
#endIf

#onlyIf modloader fabric
oresTag = <tag:items:c:ores>;
axesTag = <tag:items:c:axes>;
#endIf

//For a big write up on Replacers, take a look at the following message on the CraftTweaker discord:
//https://discord.com/channels/136877912698650625/929770828286029914/1069326234523291750


//Start the replacer.
Replacer.create()
    //Specify what to replace. We need to specify IIngredient in the <> because the type of the recipe component we're replacing (input/ingredients) is IIngredient.
    //And thus, we replace one IIngredient with another!
    .replace<IIngredient>(<recipecomponent:crafttweaker:input/ingredients>, oresTag.asIIngredient(), axesTag.asIIngredient())
    //Execute the replacer or else it won't do nothing.
    .execute();

Globals.endScript("replacer");    
