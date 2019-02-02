/*
 * This script adds a single recipe that takes a diamond pickaxe and puts all enchantments on a book.
 * This script should show how recipe functions and item transformers are supposed to work.
 * 
 * It will use a recipe function to show the enchantment book as crafting result depending on the enchantments on the pickaxe.
 * It will use an item Transformer to return the unenchanted pickaxe
 */


recipes.addShapeless("enchantment_transfer", 
    //Let's add this message to the crafting output
    <minecraft:enchanted_book>.withLore(["My enchantments depend on the pickaxe you provided"]), [
    
    //We accept any diamond pickaxe
    <minecraft:diamond_pickaxe:*>
        //We mark the pickaxe to be able to retrieve it in the crafting function later
        .marked("pickaxe")
        //Here we say that if the crafting succeeds, 
        //we return the sword without the tag that stores the enchantments
        .transformNew(function(item) {
            return item.withTag(item.tag - "ench");
        }),
    <minecraft:book>], 
    
    //This is how a crafting function is declared
    function(out, ins, cInfo) {
        //We need to return the actual crafting result here
        //We check if the item is enchanted
        //
        //If it is, return the output 
        //We could also use <minecraft:enchanted_book> instead of out
        if(ins.pickaxe.tag has "ench") {
            return out.withTag({StoredEnchantments: ins.pickaxe.tag.ench});
        }

        //Else, we return a normal book
        return <minecraft:book>;
    }, 
    //We don't need a crafting action here so let's provide null
    null);