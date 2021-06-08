"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.generate = void 0;
var flotjs_1 = require("flotjs");
var validInput = [
    'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l',
    'm', 'n', 'o', 'p', 'q', 'r',
    's', 't', 'u', 'v', 'w', 'x',
    'y', 'z', '_'
];
function generate(template, data) {
    var stream = flotjs_1.ReadStream.on(template);
    var output = [];
    var errors = [];
    var gen = function () {
        var _a;
        while (stream.peek !== '$') {
            output.push(stream.next);
        }
        stream.next;
        while (stream.peek === '$') {
            output.push(stream.next);
        }
        if (stream.atEnd())
            return;
        var property = [];
        while (validInput.includes((_a = stream.peek) === null || _a === void 0 ? void 0 : _a.toLowerCase())) {
            property.push(stream.next);
        }
        // Test if i'ts a valid property name
        var propertyName = property.join('');
        if (!data.hasOwnProperty(propertyName)) {
            var name_1 = propertyName || '"<Empty Field>"';
            errors.push(name_1 + " is not a property of " + JSON.stringify(data) + " ");
            return;
        }
        output.push(data[propertyName]);
    };
    while (!stream.atEnd()) {
        gen();
    }
    return { text: output.join(''), errors: errors };
}
exports.generate = generate;
