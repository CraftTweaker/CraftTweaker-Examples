#priority 100

import crafttweaker.api.item.IItemStack;

//Creates a new class for handling some obscure crafting recipes in the background.

public class Material {

    //Credit for this Idea and class goes to ChiefLogan!

    public var name as string : get, set;
    public var blockItem as IItemStack : get, set = <item:minecraft:air>;
    public var slab as IItemStack : get, set = <item:minecraft:air>;
    public var stair as IItemStack : get, set = <item:minecraft:air>;

    public build() as void {
        println("Building Material with name: " + this.name);
    
        //IItemStack.empty returns true if the IItemStack is equal to <item:minecraft:air>
        //If we assigned the slab item to something, we create a recipe for it.
        if (!slab.empty) {
            craftingTable.addShaped(name.toLowerCase() + "_slab_to_block", blockItem*2,
            [[slab, slab],
            [slab, slab]]);
        }
        //Same thing as above, but with the stair.
        if (!stair.empty) {
            craftingTable.addShaped(name.toLowerCase() + "_stair_to_block", blockItem*3,
            [[stair, stair],
             [stair, stair]]);
        }

        //This could go forever, have more logic or do the opposite, add stair / slab recipes based on the blockItem variable!
        //The above sentence meaning, we could have anything really. Different fields, different logic, this is just a very specific usecase.
    }
}