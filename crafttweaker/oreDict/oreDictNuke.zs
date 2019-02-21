/* oreDictNuke - BY GirlButAlsoAGun/Pexium (2019)
oreDictNuke is a script that can remove items from all IOreDictEntry objects contained within oreDict based off of some simple parameters explained below
*/

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;

#priority 999


// type is the string that oredictNukeLeading checks for at the beginning of each IOreDictEntry
// modExceptions is an array of strings, each of which is a mod that items from will be ignored when removing items from an IOreDictEntry
function oredictNukeLeading(type as string, modExceptions as string[]){
	var typeLength = type.length;
	for entry in oreDict {
		var currentEntryString = entry.name;
		if (currentEntryString.length < typeLength) {
			print("Interesting, " + currentEntryString + " is quite a small IOreDictEntry...");
		}
		else {
			var i = 0;
			var currentEntryMatcher = "";
			while i < typeLength {
				currentEntryMatcher += currentEntryString[i];
				i = i + 1;
			}
			if (currentEntryMatcher == type) {
				for item in entry.items {
					var exIter = 0;
					var removeThis = true;
					while exIter < modExceptions.length {
						if (item.definition.owner == modExceptions[exIter]) {
							removeThis = false;
						}
						exIter = exIter + 1;
					}
					if(removeThis == true){
						entry.remove(item);
					}
				}
			}
		}
	}
}

					
//EXAMPLE
val exceptions = ["minecraft", "chisel", "gregtech"] as string[];

oredictNukeLeading("ore", exceptions);
