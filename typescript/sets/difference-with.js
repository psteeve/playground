"use strict";
var __spreadArray = (this && this.__spreadArray) || function (to, from) {
    for (var i = 0, il = from.length, j = to.length; i < il; i++, j++)
        to[j] = from[i];
    return to;
};
exports.__esModule = true;
exports.differenceWith = void 0;
function differenceWith(list, list2, equalityFun) {
    if (equalityFun === void 0) { equalityFun = function (a, b) { return a === b; }; }
    var result = new Set();
    list.forEach(function (value) {
        var exist = false;
        list2.forEach(function (val) {
            if (equalityFun(value, val)) {
                exist = true;
            }
        });
        if (!exist) {
            result.add(value);
        }
    });
    return __spreadArray([], result);
}
exports.differenceWith = differenceWith;
