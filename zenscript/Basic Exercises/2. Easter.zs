/*
 * EXERCISE
 *
 * Calculate the date for easter following the algorithm Gauß published 1816.
 *
 * The algorithm goes as follows:
 *
 * a = year mod 19
 * b = year mod 4
 * c = year mod 7
 * k = year div 100
 * p = (8k + 13) div 25
 * q = k div 4
 * m = (15 + k - p - q) mod 30
 * n = (4 + k - q) mod 7
 * d = (19a + m) mod 30
 * e = (2b + 4c + 6d + n) mod 7
 * easter = (22 + d + e)
 * 
 * The resulting number is relative to the 1st of March, so the 32nt March equals the first of April.
 * Write the algorithm in a function and verify that it works with some years.
 *
 * Note: "div" is the integer division
 * Note: "mod" is the remainder of an integer division
 * 
 */

function easterDate(year as int) as int {
    val a = year % 19;
    val b = year % 4;
    val c = year % 7;
    val k = year / 100;
    val p = (8 * k + 13) / 25;
    val q = k / 4;
    val m = (15 + k - p - q) % 30;
    val n = (4 + k - q) % 7;
    val d = (19 * a + m) % 30;
    val e = (2 * b + 4 * c + 6 * d + n) % 7;
    return (22 + d + e);
}


print("Easter in 2019: " ~ easterDate(2019)); //Expect 52
print("Easter in 2018: " ~ easterDate(2018)); //Expect 32