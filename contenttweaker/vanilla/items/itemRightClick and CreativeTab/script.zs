#loader contenttweaker
import mods.contenttweaker.VanillaFactory;


//We create this representation first so that we can use it in the zsTab.
val gear = VanillaFactory.createItem("gear");

//This will be the creative tab where all the items will be put.
val zsTab = VanillaFactory.createCreativeTab("random_cot", gear);
zsTab.register();

//Now we can actually register the other traits for the gear.
gear.maxStackSize = 64;
gear.creativeTab = zsTab;
gear.register();


//From here on, we don't need to split the registrations.
/*
 *
 * The life Belt is an item that helps a player lost on the ocean.
 * It gives the player Night vision and Water Breathing for 300 seconds.
 *
 */
var lifeBelt = VanillaFactory.createItem("life_belt");
lifeBelt.maxStackSize = 1;
lifeBelt.creativeTab = zsTab;
lifeBelt.maxDamage = 1;
lifeBelt.itemRightClick = function(stack, world, player, hand) {
    //We don't do anything on a client world, return PASS to allow other handlers to take this action if needed
    if(world.remote) {
        return "PASS";
    }

    //We give the player night vision and water breathing for 300 seconds if the item is used.
    //You could also directly write 6000 but 300 * 20 ticks is more readable for some.
    player.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(300 * 20, 1, false, false));
    player.addPotionEffect(<potion:minecraft:water_breathing>.makePotionEffect(300 * 20, 1, false, false));

    //Damage 1 would not yet break it so let's use 2
    stack.damage(2, player);

    return "SUCCESS";
};

lifeBelt.register();



/*
 * The adventurer's heart restores all of your HP and fully feeds you if used.
 * It has a limited amount of uses.
 *
 * Think if this item as some sort of unique-per-player item:
 * It is meant to have a means of restoring the damage points.
 * It should only be completely used in case of emergency, because
 * if the last use is depleted it also gives the player a strong Strength and Regeneration effect.
 *
 */

var heart = VanillaFactory.createItem("heart");
heart.maxStackSize = 1;
heart.creativeTab = zsTab;
//10 uses
heart.maxDamage = 9;
heart.itemRightClick = function(stack, world, player, hand) {
    //We don't do anything on a client world, return PASS to allow other handlers to take this action if needed
    if(world.remote) {
        return "PASS";
    }

    
    player.health = player.maxHealth;
    player.foodStats.addStats(20, 10.0D);

    //If on the last damage sector
    if(stack.damage >= 9) {
        player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(300 * 20, 5));
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(120 * 20, 10));
    }

    stack.damage(1, player);


    return "SUCCESS";
};
heart.register();


/*
 * The Ying-Yang Equilibrium of Souls is an item that allows you to store and retrieve health points
 *
 * It can be filled by using it while sneaking.
 * It can be drained by using it without sneaking.
 *
 * Should you attempt to drain it when it's empty it will give you a nausea effect.
 *
 */

var yingYang = VanillaFactory.createItem("ying_yang");
yingYang.maxStackSize = 1;
yingYang.creativeTab=zsTab;
//Damage will show stored health, up to 100
yingYang.maxDamage = 99;
yingYang.itemRightClick = function(stack, world, player, hand) {
    //We don't do anything on a client world, return PASS to allow other handlers to take this action if needed
    if(world.remote) {
        return "PASS";
    }

    if(player.isSneaking) {
        stack.damage(-1, player);
        player.health -= 1.0F;
    } else {
    	if(stack.damage >= 99) {
    	    player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(10 * 20, 1, false, false));
    	} else {
    		stack.damage(1, player);
    		player.health = min(player.maxHealth, player.health + 1.0F);
    	}
    }

    return "SUCCESS";
};

yingYang.register();