var sayHi;
var name = 'Patty';

if (name == 'Jim'){
	sayHi = function () {
		console.log("Hi, Jim!");
	};
} else {
	sayHi = function () {
		console.log("Hi");
	};
}

sayHi();