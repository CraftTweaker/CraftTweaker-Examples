#loader contenttweaker

/*
 * This script will create a custom enchantment using ContentWeaker.
 * This enchantment will be a double-edged curse.
 * It will amplify the user's damage.
 * Though it will instantly kill the user once the user is hit.
 *
 * Note, merge the en_us.lang file with your current one if you 
 * want the enchantment to be localized.
 */

//Create an enchantmentBuilder for the name "cursed"
//Note: Use a more distinct name in a larger pack.
//      "Enchantment.cursed" might already be used...
val builder = mods.contenttweaker.enchantments.EnchantmentBuilder.create("cursed");

//This is a curse (makes the enchantment show red)
builder.curse = true;
//Why not?
builder.allowedOnBooks = true;
//This enchantment only works on weapons in the user's main
builder.applicableSlots = [mainHand];
//This enchantment only works for weapons
builder.setTypeWeapon();
//And is really rare
builder.setRarityVeryRare();
//It ranges from level 1 to 5
//we don't need to set minLevel cause that's 1 by default
builder.maxLevel = 5;

//This function returns the enchantment's Damage modifier
//We just return 2.5 times the level of the enchant (needs to return a float)
builder.calcDamageByCreature = function(thisEnch, level, damageSource){
	return 3.14159265359f * level;
};

//We want the user to die once hurt so we also provide the onUserHurt function.
//For other enchantments you could for example implement a thorns effect or similar.
builder.onUserHurt = function(thisEnch, entity, attacker, level) {
    entity.sendMessage("Your greed has cost you dear, my dear!");
	entity.onKillCommand();
};

//This needs to be run last to actually register the user
builder.register();
