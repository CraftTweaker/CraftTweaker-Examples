import crafttweaker.entity.IEntityLivingBase;


/*
 * This event handler makes entities spawn lava in the world when they die
 * Entities includes the player!
 *
 */
events.onEntityLivingDeath(function(event as crafttweaker.event.EntityLivingDeathEvent) {
    //We only do this if we are not on the client.
	if(event.entity.world.remote) {
	    return;
	}

	//set the block where the entity currently is to lava
	event.entity.world.setBlockState(<blockstate:minecraft:lava>, event.entity.position);
});