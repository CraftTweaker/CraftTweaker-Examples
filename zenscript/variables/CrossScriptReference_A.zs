/*
 * Some methods and variables can be accessed from scripts other than the script they were originally declared in.
 * This script defines methods and variables that will be accessed in CSR_B
 * Make sure that your script and folder names don't contains whitespaces nor start with a digit.
 * This would prevent ZS from properly getting the scripts and members.
 *
 */

//We use a priority preprocessor to ensure this script will be loaded first.
#priority 100


global someGlobal as string = "abc";
static someStatic as string = "def";

function myFunction() as string {
    return "ghi";
}


global myFunctionExpressionGlobal as function()string = function() as string {
    return "jkl";
};


static myFunctionExpressionStatic as function()string = function() as string {
    return "mno";
};