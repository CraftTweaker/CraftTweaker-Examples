/*
 * Some methods and variables can be accessed from scripts other than the script they were originally declared in.
 * This script accesses methods and variables declared in CSR_A
 *
 * IMPORTANT:
 * This script assumes that the files are within the "scripts" folder directly.
 * If you have the files in a subfolder you will need to modify the names as they are relative to the scripts folder!
 */

 //We use a priority preprocessor to ensure this script will be loaded after CSR_A
#priority 0


//Declared globally so we can directly reference it.
print(someGlobal);

//We refer to the script and then the static is a member.
print(scripts.CrossScriptReference_A.someStatic);


//Same goes for functions
print(scripts.CrossScriptReference_A.myFunction());


//Expression functions can be declared global.
//If they are they can directly be accessed
print(myFunctionExpressionGlobal());

//If they are not they need to be referenced by script file
print(scripts.CrossScriptReference_A.myFunctionExpressionStatic());