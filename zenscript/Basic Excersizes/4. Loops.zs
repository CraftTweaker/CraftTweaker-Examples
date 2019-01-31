#debug
/*
 * EXCERSIZE 1
 *
 * Create a program that prints a temparature table from Fahrenheit to Celsius
 * The table should start at 0° F and end at 300 ° Fahrenheit.
 * The gap between the values should be 20° F.
 * 
 * The formula to calculate the difference is:
 * c = (5/9) * (f - 32);
 * 
 * Example Output (you don't need to keep such a clean table, the values are more important):
 *
 * Fahrenheit | Celsius
 * -----------+--------
 *          0 | -17.8
 *         ...
 *        300 | 148.9
 *
 */


print("Excersize 1: Temperature table");

print("Fahrenheit | Celsius");
print("-----------|--------");

for i in 0 .. 15 {
    val fahrenheit = i * 20;
    print(fahrenheit ~ "        | " ~ ((5.0d / 9.0d) * (fahrenheit - 32)));
}

    

/*
 * EXCERSIZE 2
 *
 * The wildlife stock in a forest equals 200 Deer
 * Every year, the population grows by 10% relative to the beginning of the given year.
 * At the end of the year, 15 Deer are shot.
 *
 * How will the population develop in the next years?
 *
 * Write a program that prints the population for the next years, until it has reached at least 300.
 *
 * 
 * 
 * Example output:

 * 1: 205 Deer
 * 2: 210 Deer
 * 3: 216 Deer
 * 4: 222 Deer
 * 5: 229 Deer
 * 6: 236 Deer
 * 7: 244 Deer
 * 8: 253 Deer
 * 9: 263 Deer
 * 10: 274 Deer
 * 11: 286 Deer
 * 12: 299 Deer
 * 13: 313 Deer
 *
 */


print("Excersize 2: Deer");
var deer = 200 as int;
print("Deer at the beginning: " ~ deer);

var year = 0;
while(deer < 300) {
    deer = ((deer as double) * 1.10d) as int - 15;
    year += 1;
    print(year ~ ": " ~ deer ~ " Deer");
}




/*
 * EXCERSIZE 3
 * 
 * Write a program that prints a 10x10 multiplication table
 *
 *
 * Example output:
 *
 * 1  2  3   4  5  6  7  8  9 10
 * 2  4  6   8 10 12 14 16 18 20
 * 3  6  9  12 15 18 21 24 27 30
 * 4  8  12 16 20 24 28 32 36 40
 * 5  10 15 20 25 30 35 40 45 50
 * 6  12 18 24 30 36 42 48 54 60
 * 7  14 21 28 35 42 49 56 63 70
 * 8  16 24 32 40 48 56 64 72 80
 * 9  18 27 36 45 54 63 72 81 90
 * 10 20 30 40 50 60 70 80 90 100
 *
 */

print("Excersize 3: Multiplication table");

for i in 0 .. 11 {
    var line = "";
    for j in 0 .. 11 {
        line += (i * j) ~ "\t";
    }
    print(line);
}


/*
 * Excersize 4
 *
 * The Babylonian way of extracting a mathematical root (also called as Heron-Algorithm) is an older iterative Algorithm to approximate a number's square root.
 *
 * It goes as follows:                   a
 *                                Xn  + -----
 *                                       Xn
 *                       Xn+1 =   --------------
 *                                      2
 *
 *
 *
 * Note: n+1 and n are indices of X not actual numbers!
 *
 * In this algorithm a is the (positive) number whose root is to be approximated.
 * The starting point X0 can, as long as it is not zero, be any fixed value.
 * Keep in that negative values will converge to the negative square root.
 *
 *
 * Implement the Heron-Algorithm in such a way, that the root approximated to 6 digits after the comma (i.e. such that the difference between Xn and Xn+1 is less thatn 1e-6)
 *
 * Example output for 25
 * xn: 1.0
 * xn: 13.0
 * xn: 7.461538461538462
 * xn: 5.406026962727994
 * xn: 5.015247601944898
 * xn: 5.000023178253949
 * xn: 5.000000000053722
 * 
 * The square root of 25.0 is approximately 5.0
 *
 */

print("Excersize 4: Heron");

function heron(number as double) as void {
    var Xn = 1.0D;
    var difference = 1.0D;
    while(difference >= 1.0e-6) {
        print("Xn: " + Xn);
        var xNext = (Xn + (number / Xn)) / 2.0D;
        difference = xNext - Xn;
        Xn = xNext;

        //We want it positive
        if(difference < 0.0D) {
            difference *= -1;
        }
    }

    print("The square root of " ~ number ~ " is approximately " ~ Xn);
    return;
}



heron(25.0D);