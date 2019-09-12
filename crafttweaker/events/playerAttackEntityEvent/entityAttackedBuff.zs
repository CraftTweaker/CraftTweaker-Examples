import crafttweaker.entity.IEntityLivingBase;


/*
 * This event handler gives all entities that were attacked a strength 100 effect for 10 seconds.
 *
 */
events.onPlayerAttackEntity(function(event as crafttweaker.event.PlayerAttackEntityEvent) {
    //We only do this if we are not on the client.
    //We only do this if the entity is IELB cause only that has the method to add the potion effect.
	if(event.target.world.remote || !(event.target instanceof IEntityLivingBase)) {
	    return;
	}

	//Get the entity and cast uncheched.
	val entityLiving as IEntityLivingBase = event.target;
	entityLiving.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(10 * 20, 100));
});