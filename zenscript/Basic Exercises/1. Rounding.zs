/*
 * EXERCISE 1
 *
 * Read the program fragment below, and explain how the computer converts a floating point variable to an integer.
 *
 */


var pi = 3.1415926d;
var e  = 2.7182818d;

val piInt = pi as int;
val eInt  = e  as int;

print("Pi as whole number: " ~ piInt);
print("E as whole number: " ~ eInt);


/*
 * EXERCISE 2
 *
 * Find a way to print pi and e to rounded half away from zero (i.e. if the value after the comma is >= 0.5 you round up, otherwise you round down)
 *
 */

val piIntRounded = (pi + 0.5d) as int;
val eIntRounded = (e + 0.5d) as int;

print("Pi as whole number (rounded): " ~ piIntRounded);
print("E as whole number (rounded): " ~ eIntRounded);



/*
 * EXERCISE 3
 *
 * Adapt the algorithm above to also work with negative numbers
 * Use a function that stores the algorithm
 * Test your function with the positive and negative values of pi and e
 *
 */

function round(number as double) as int {
    if(number < 0) {
        return (number - 0.5d) as int;
    } else {
        return (number + 0.5d) as int;
    }
}


print("Pi as whole number (rounded, ex3): " ~ round(pi));
print("Pi as whole number (rounded, negative, ex3): " ~ round(-pi));

print("E as whole number (rounded, ex3): " ~ round(e));
print("E as whole number (rounded, negative, ex3): " ~ round(-e));