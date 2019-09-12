/*
 * This script is meant to explain how variable scopes work
 *
 * A variable's scope is the range where it is valid and can be accessed.
 * A variable name needs to be unique within one scope layer.
 *
 * There are different scope layers:
 *     The global scope is shared between all scripts.
 *         Variables like `recipes` and `scripts` are stored in there.
 *         Globals are added to this scope once their script is loaded.
 *     The script scope is valid for the complete script.
 *         Statics and function names are added to this.
 *         All variables from the Global scope are accessible
 *     Block scopes range from a { to a }.
 *         You can nest block scopes.
 *         All upper scope layer variables are accessible in a lower one
 *
 */


//Outside the variable's scope, cause it has not yet been declared nor initialized.
//print(myVariable);


//Begin varaible scope
var myVariable = "abc";

//Now it is useable
print(myVariable);



//We already have a variable named myVariable in this scope level
//var myVariable = "";


//A code block creates a new scope layer.
//This lower scope is a sub-scope of the outer one, that means all variables declared outside are still accessible within this scope.
{
    //Works because this is a subscope of the outer one.
	print("CodeBlock print 1: " + myVariable);

    //Works because this variable will be bound to the inner scope.
    //This is called "shadowing" because within this block, the outer variable will no longer be visible.
	var myVariable = "CodeBlock";

	//Prints "CodeBlock"
	print("CodeBlock print 2: " + myVariable);

}
//End of Block scope.
//All variables that were declared within the scope are no longer visible.


//Now we have left the block, so this prints "abc" again
print("After Code Block: " ~ myVariable);


function someFunction() as void {
	//This is a special scope.
	//Like statics, functions are compiled before the script runs, so we cannot access variables from the outside.

    //Will not work cause the variable does not exist
	//print(myVariable);

	//You also cannot refer to statics/globals declared in the same script.
	//Though referring to ones declared in other scripts works fine.

	//You can also refer to functions that were already declared.
}

var someFunction2 = function() as void {
	//The same that applies for static functions applies for function variables as well, with one difference:
	//You are able to also refer to statics/globals from within the same script.
};




//End of variable scope for "myVariable"
//It was declared on the uppermost level so it's scope ends with the script.