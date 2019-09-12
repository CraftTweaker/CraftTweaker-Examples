/*
 * EXERCISE 1: 
 *
 * Write a function "variance" that calculates and prints the average value and the variance of numbers in a given (double) array.
 * 
 * The formula for the average is:
 *
 * avg = (1/n) * {nΣi=1}(x[i])
 *
 *
 * The formula for the variance is:
 * 
 * v = (1/n-1) * {nΣi=1}((x[i] - avg) ^ 2)
 *
 *
 * If you take the square root of the variance you get the standard deviation.
 * You could take the Heron-Algorithm from an earlier exercise to calculate it if you wanted to.
 *
 */

function variance(inputNumbers as double[]) as void {
    if(inputNumbers.length == 0) {
        //Nothing to do, bad input
        return;
    }


    var sum = 0.0D;

    for number in inputNumbers {
        sum += number;
    }

    val average = sum / inputNumbers.length;



    var varianceSum = 0.0D;

    for number in inputNumbers {
        varianceSum += (number - average) * (number - average);
    }

    val variance = varianceSum / (inputNumbers.length - 1);

    print("Average: " ~ average);
    print("Variance: " ~ variance);
}

print("Testing Variance, expecting Avg 2.0 and Variance 1.0");
variance([1.0, 2.0, 3.0]); 


/*
 * EXERCISE 2:
 * 
 * The fibonacci-sequence starts with F0 = 1 and F1 = 1 and is defined as
 * 
 * Fn = Fn-1 + Fn-2
 * 
 *
 * Write a function that returns the first n fibonacci numbers (with n being a parameter) in an array
 * 
 */

function fibonacci(amount as int) as long[] {
    var fibonacci = [1, 1] as long[];

    for n in 2 .. amount {
        fibonacci += fibonacci[n - 1] + fibonacci[n - 2];
    }

    return fibonacci;
}

print("Testing Fibonacci");
for fib in fibonacci(10) { //1,1,2,3,5,8,13,21,34,55
    print(fib);
}



/*
 * EXERCISE 3:
 *
 * "Eratostenes's sieve" is an algorithm that calculates all prime numbers between 2 and a set upper boundary n:
 *
 * (1) Set "sieve" = All natural numbers from 2 to n
 * (2) Set "primes" = empty set
 * (3) Repeat steps (4) to (6) until sieve is empty
 *     (4) find the smallest number in sieve
 *     (5) add min to primes
 *     (6) remove min and all it's multitudes from sieve
 *
 *
 * Write a function that implements this algorithm and accepts the upper boundary as parameter
 *
 * Tip: You can also use a boolean array with n (or n+1) values to realize this program.
 *
 */


function eratostenes_1(n as int) as int[] {
    var sieve = [2] as int[];
    var primes = [1] as int[];

    for i in 3 .. (n + 1) {
        sieve += i;
    }


    while(sieve.length > 0) {
       var min = sieve[0];
       var newSieve = [] as int[];
       primes += min;

       for i in sieve {
            if(i % min != 0) {
                newSieve += i;
            }
       }

       sieve = newSieve;
    }

    return primes;
}



function eratostenes_2(n as int) as int[] {
    var sieve = [false, true] as bool[];
    for i in 2 .. n+1 {
        sieve += true;
    }


    for i in 2 .. sieve.length {
        if(sieve[i]) {
            for j in (i + 1) .. sieve.length {
                if(j % i == 0){
                    sieve[j] = false;
                }
            }
        }
    }


    var primes = [] as int[];
    for i, isPrime in sieve {
        if(isPrime)
            primes += i;
    }

    return primes;
}



print("Testing eratostenes_1 with n=19");
for i in eratostenes_1(19) {
    print(i);
}

print("Testing eratostenes_2 with n=19");
for i in eratostenes_2(19) {
    print(i);
}



/*
 * EXERCISE 4: 
 * 
 * The Bubblesort algorithm works as follows:
 * Two elements that are next to each other are compared:
 * If they are in the wrong order, they will be switched.
 * This will be repeated until all elements are in the correct order.
 *
 * Example:
 *
 * (5,3,1,2) → (3,5,1,2) → (3,1,5,2) → (3,1,2,5) → (1,3,2,5) → (1,2,3,5)
 *
 *
 * Write a function that accepts an unordered array of integers and sorts it.
 * Directly manipulate the list, and return it afterwards.
 * Use the Bubblesort algorithm.
 *
 */

function bubblesort(list as int[]) as int[] {
    var manipulated = true;

    while(manipulated) {
    	manipulated = false;
        for i in 1 .. list.length {
            if(list[i - 1] > list[i]) {
                manipulated = true;
                //Swap
                val temp = list[i - 1];
                list[i - 1] = list[i];
                list[i] = temp;
            }
        }
    }

    return list;
}


print("Checking bubblesort");

for i in bubblesort([5, 3, 1, 2]) {
	print(i);
}