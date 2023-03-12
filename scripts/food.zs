//A minimal and basic script that shows how to modify and give items food properties.

import crafttweaker.api.food.FoodProperties;

Globals.startScript("food");

val edibleItems = [
    <item:minecraft:diamond_sword>
];

//An alternative could be <item>.food if you just wanted to add an effect to an existing food without figuring out the actual values.
var myFood = FoodProperties.create(4, 2.0);

//Check out more things you can do with FoodProperties here: https://docs.blamejared.com/1.19/en/vanilla/api/food/FoodProperties
//Methods are instance based, so you either do:

/*

myFood = myFood.setIsMeat();

        OR

var myFood = FoodProperties.create(4, 2.0).setIsMeat();

*/

for futureFoodItem in edibleItems {
    futureFoodItem.food = myFood;
}

//Makes the following items inedible:

val inedibleItems = [
    <item:minecraft:golden_carrot>
];

for inedible in inedibleItems {
    inedible.food = null;
}

Globals.endScript("food");
