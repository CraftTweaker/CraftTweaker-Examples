#loader crafttweaker

import crafttweaker.event.CommandEvent;
import crafttweaker.player.IPlayer;

/* 
 * We want to register a command handler that prints a message to the player's chat if they execue the "/ct syntax" command.
 * This handler then also gives them Regeneration III for 21 seconds.
 * Command handlers are functions with a specific event type that needs to be provided.
 * Here we use the commandEvent, hence the "as CommandEvent".
 * To actually subscribe to the commandEvents we use "events.onCommand" and supply the command handler.
 * Important, the CommandEvent type needs to be imported, otherwise we'd have to use "as crafttweaker.event.CommandEvent"
 */
events.onCommand(function(event as CommandEvent) {
    //First we store the command in a local variable.
    //This way we don't always have to call "event.command.XXX" but can use "command.XXX"
    val command = event.command;

    //If the command is null/invalid we don't want this handler to do anything, so we return.
    //
    //If the command executed is not "crafttweaker" we don't want this handler to do anything, so we return.
    //This uses the command name, not the alias, so "/ct" would still return "crafttweaker"
    //
    //If the command was executed without any parameters (e.g. if the user called "/ct") we don't want this handler to do anything, so we return.
    //
    //If the command's first parameter is not "syntax" (e.g. if the user called "/ct help") we don't want this handler to do anything, so we return.
    if(isNull(command) || (command.name != "crafttweaker") || (event.parameters.length == 0) || (event.parameters[0] != "syntax")) {
        return;
    }

    //Checks if the one sending the command is a player
    if(event.commandSender instanceof IPlayer) {
        //If it is a player, store it in this variable
        //Assignments like this are unchecked so there may be an exception if it was not an IPlayer!!!
        val player as IPlayer = event.commandSender;
        
        //Sends the string to the player. Only to the player.
        player.sendChat("You executed /ct syntax");

        //Applies a regeneration III effect for 22 seconds (21 * 20 ticks) to the player.
        //You could also directly write 420, but this way may be clearer for novices.
        player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(21 * 20, 3));
    }
});