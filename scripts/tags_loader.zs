#loader tags

//The purpose of the tags loader is to provide a window before crafttweaker and regular recipes load to modify tags.

//Why? Well for CraftTweaker, this means you don't need to worry about putting priority in scripts, 
//or making sure your recipes that depend on tags you modify are done afterwards.

//What is more, any mods that might query the contents of a tag for certain compat or conditional recipes might check this BEFORE CraftTweaker
//scripts load at all, something this loader can also ammend.

//However, due to the loader being present before CraftTweaker you have no access to most things.

//Most of the classes and types are missing from CraftTweaker though. 
//You have access to the ZenCode classes, but not to the <item> bracket expression parser... So use resources and code smartly!

//Custom classes don't exist here either... unless you make them in the loader tags!

<tag:items:minecraft:planks>.addId(<resource:minecraft:tnt>); 