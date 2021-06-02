"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var rxjs_1 = require("rxjs");
var observable = rxjs_1.of([1, 2, 3]);
var ob = rxjs_1.from([1, 2, 4]);
var inter = rxjs_1.interval(100);
observable.subscribe(function (x) { return console.log(x); });
ob.subscribe(function (x) { return console.log(x); });
inter.subscribe(function (x) { return console.log(x); });
