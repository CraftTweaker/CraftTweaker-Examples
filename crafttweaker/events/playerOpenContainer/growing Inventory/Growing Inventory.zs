import crafttweaker.event.PlayerOpenContainerEvent;

/*
 * This is a fun script that is supposed to show what IContainer can do.
 * We use the PlayerOpenContainerEvent.
 * This event exposes the container that was opened as IContainer.
 * An IContainer is a (manipulateable) inventory
 *
 * We also print all items to the Crafttweaker log
 */

events.onPlayerOpenContainer(function(event as PlayerOpenContainerEvent){
	//Printed whenever the event is called.
	print("Someone opened an Inventory");
	print("Exaniming Items:");

	//Iterates over all the items in the container
	//This works because IContainer is an Iterable for IItemStacks.
	//Few classes are that but you can usually read this on the wiki if 
	//an object allows you to iterate over it.
	for i, item in event.container {

	    //First we print the item we can find, or <null> if none is present
	    if(isNull(item)) {
	        print("\t\t<null>");
	    } else {
	        print("\t\t" ~ item.commandString);
	    }

	    //Now we update each item's stack size to the slot they are in.
	    //Counting starts at index 0 so we first add one to the current index.
		if (!isNull(item))
			event.container.setStack(i, item * (i + 1));
	}

});