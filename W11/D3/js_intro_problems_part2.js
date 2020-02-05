// Phase I: Callbacks

function titleize(names, cb) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  cb(titleized);
};

titleize(["Mary", "Brian", "Leo"], (names) => { 
  names.forEach(name => console.log(name));
});

/* Mx.Mary Jingleheimer Schmidt
Mx.Brian Jingleheimer Schmidt
Mx.Leo Jingleheimer Schmidt */

// Phase II: Constructors, Prototypes, and this

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
};

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes phrRRRRRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

//e = new Elephant("Dumbo", 96, ["painting a picture", "balancing a ball", "spraying water"])

// Phase III: Function Invocation

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (herd) {
  herd.forEach(elephant => console.log(`${elephant.name} is trotting by!`));
};

// Phase IV: Closures

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};