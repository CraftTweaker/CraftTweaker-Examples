/* 
 *
 * This script is meant to explain the different types of variables.
 *
 *
 */


/* 
 * Simplest is "var", which stands for "variable"
 * A variable is declared using a name and an optional initializer and type.
 * After it is declared you can use the name as expression where needed, until you leave the scope (scopes are explained in another file).
 * You need either an initializer or a type so that ZS can figure out what type it actually is
 *
 */

//Full declaration, with initializer and type.
var myVariable as string = "abc";

//Normally this declaration suffices, since ZS can infer the type from the expression.
var myOtherVariable = "abc";

//If you need to declare it before you can actually write to the variable, you will need to specify the type.
var myThirdVariable as string;
myThirdVariable = "abc";


/*
 * No matter which method you chose to declare and initialize a variable, you are able to re-assign
 * the variable, as long as the new value is of the same type as your variable
 */

var someVariable = "abc";
//Same type, works
someVariable = "def";


//DOES NOT WORK
//IItemStack != string
//someVariable = <minecraft:iron_ingot>;



/*
 * A more restrictive sibling of "var" is "val", which stands for "value"
 * Unlike vars, vals need to be initialized the moment they are declared.
 * They are also final, which means you cannot re-assign them.
 * 
 */

//Full declaration, with initializer and type.
val myValue as string = "abc";

//Normally this declaration suffices, since ZS can infer the type from the expression.
val myOtherValue = "abc";

//DOES NOT WORK
//val myThirdValue as string;
//myThirdValue = "abc";

//Neither does reassigning
//val someValue = "abc";
//someValue = "def";


/*
 * A special variant of "val" is "static"
 * They also NEED their type declared, and cannot infer it from the expression.
 *
 * Statics are special in the case that they are bound to the script class and not the context.
 * This means that they can be accessed in contexts that are normally not accessible.
 * This also means that they need to be initialized with Expressions that are not bound to the execution context.
 *
 * In other words, do not assign a nonstatic variable to a static one!
 * Also, statics are initialized before the script actually loads, no matter where you declared them!
 *
 */

//Full declaration, with initializer and type.
static myStatic as string = "abc";

//DO NOT WORK
//static myOtherStatic = "abc";
//static myThirdStatic as string;
//static myThirdStatic = "abc";



/*
 * This test is supposed to show you that statics are initialized before anything else in the script.
 * We assign "abc" to the variable.
 * Don't mind the function that's just so that it actually prints something when it's being assigned.
 *
 * See that it prints ("testStatic is being initialized") BEFORE it prints "Testing statics"?
 * This is also the reason why they cannot be initialized by nonstatic variables.
 *
 */
print("Testing statics: ");
static testStatic as string = function() as string {print("Static testStatic is being initialized"); return "abc";}();


/*
 * A special variant of "static" is "global"
 * They behave exactly the same as statics but have one slight difference:
 * Globals can be accessed in any script that loads after them as if they were declared within that script.
 *
 * This allows you to have one file where you declare all variables that are commonly used or whose value may need to change.
 * Don't overdo it though, since globals can make debugging very hard, if you also shadow variables accidentally.
 *
 */

//same as with statics
global myGlobal as string = "abc";