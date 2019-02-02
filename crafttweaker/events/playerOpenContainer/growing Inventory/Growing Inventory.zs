import crafttweaker.event.PlayerOpenContainerEvent;

/*
 *
 * WARNING: DO NOT USE THIS IN AN ACTUAL PACK, THIS IS FOR TESTING ONLY!
 *
 *
 * This is a fun script that is supposed to show what IContainer can do.
 * We use the PlayerOpenContainerEvent.
 * This event is called whenever a contaner (E.g crafting table/chest/anvil) is opened.
 * This event exposes the container that was opened as IContainer.
 * An IContainer is a (manipulateable) inventory
 *
 * We also print all items to the Crafttweaker log
 *
 * To make things fun we will set every item's stack size to their 
 * slot's index in the container
 */

events.onPlayerOpenContainer(function(event as PlayerOpenContainerEvent){
	//Printed whenever the event is called.
	print("Someone opened an Inventory");
	print("Examining Items:");

	//Iterates over all the items in the container
	//This works because IContainer is an Iterable for IItemStacks.
	//Few classes are that but you can usually read this on the wiki if 
	//an object allows you to iterate over it.
	for slotIndex, itemInSlot in event.container {

	    //First we print the item we can find, or <null> if none is present
	    if(isNull(itemInSlot)) {
	        print("\t\t<null>");
	    } else {
	        print("\t\t" ~ itemInSlot.commandString);
	    }

	    //Now we update each item's stack size to the slot they are in.
	    //Counting starts at index 0 so we first add one to the current index.
		if (!isNull(itemInSlot))
			event.container.setStack(slotIndex, itemInSlot * (slotIndex + 1));
	}

});