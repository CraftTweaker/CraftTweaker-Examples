#priority 100

//We will use this class to store global methods and variables.

public class Globals {

    //Utility class to call in any script with the name to easily track in the log where the script start and ends.
    //Call with Globals.startScript("scriptName");

    public static startScript(scriptName as string) {
        println("===================================");
        println("       Starting Script: " + scriptName + + ".zs       ");
        println("===================================");
    }

    public static endScript(scriptName as string) {
        println("===================================");
        println("       Starting Script: " + scriptName + + ".zs       ");
        println("===================================");
    }

    //Coming soon: Global variables

}