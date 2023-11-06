#priority -1

/*
* This preprocessor allows you to set a priority to your scripts.

* Priority allows you to control how early a script is loaded in relation to other scripts.
* Controlling this is useful, as some scripts or modifications MUST run before others for the logic to make sense:

* The default priority is 0, and negative priority is allowed.

* - Classes must be defined before using them
* - Tags must have elements before using them in a recipe
* - Adding a recipe for an item X and removing all recipes that output X must be done in the correct order.

*/

Globals.startScript("priority");

println("Hello from the last script to load");

Globals.endScript("priority"); 