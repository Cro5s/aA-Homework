function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping1(); // in block, in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping2(); // in block, out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping3(); // SyntaxError

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

mysteryScoping4(); // in block, out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

mysteryScoping5(); // SyntaxError

function madLib(verb, adjetive, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjetive.toUpperCase()} ${noun.toUpperCase()}.`
}

madLib('make', 'best', 'guac'); //"We shall MAKE the BEST GUAC."

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

isSubstring("time to program", "time") //true
isSubstring("Jump for joy", "joys") //false

function fizzBuzz(array) {
  let results = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      results.push(el);
    }
  });

  return results;
}

fizzBuzz([3, 7, 1, 6, 10, 14, 15, 20, 21]) //[3, 6, 10, 20, 21]

function isPrime(num) {
  if (num < 2) return false;
   
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

isPrime(2) //true
isPrime(10) //false
isPrime(15485863) //true
isPrime(3548563) //false

function sumOfNPrimes(num) {
  let sum = 0;
  let primeCount = 0;
  let i = 2;

  while (primeCount < num) {
    if (isPrime(i)) {
      sum += i;
      primeCount++;
    }
    i++;
  }

  return sum;
}

sumOfNPrimes(0) //0
sumOfNPrimes(1) //2
sumOfNPrimes(4) //17