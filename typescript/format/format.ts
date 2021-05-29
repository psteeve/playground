// Implement the format function of common lisp

import { ReadStream } from 'flotjs';

export function format(_destination: any, _controlString: string, ..._formatArgs: any[]) {

}


// Printing content of a list
// Lisp
// (format t "~{~a~^, ~}" '(1 2 3))
// 1, 2, 3
// TypeScript
// format(null, "~{~a~^, ~}", [1, 2, 3])
// 1, 2, 3


function formatter(controlString: string) {
    const stream = ReadStream.on(controlString);
    const directives = [];

    while (!stream.atEnd()) {
        const next = stream.next;
        if (next === '~') {
            const k = stream.next;

            if (k === 'a') {
                directives.push({
                    type: 'directive',
                    value: 'a'
                });
            }

            if (k === '{') {

                directives.push({
                    type: 'directives',
                    value: '{'
                });
            }

            if (k === '}') {
                directives.push({
                    type: 'directives',
                    value: '}'
                });
            }
        } else {
            directives.push({
                type: 'element',
                value: next
            });
        }

    }

    return directives;
}


var t = formatter("paul steevenson est ~{~a~}");

console.log(t);


