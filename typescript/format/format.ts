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

export interface DirectiveNode {
    numericParameter?: number;
    columnModifier?: boolean;
    atSignModifier?: boolean;
    run(args?: any[]): string
}

export interface NewLineDirective extends DirectiveNode {
}

export class TildeDirective implements DirectiveNode {

    constructor(public numericParameter = 1) {
        this.numericParameter = this.numericParameter;
    }

    public run(): string {
        let result = [];

        for (let i = 0; i < this.numericParameter; i++) {
            result.push('~');
        }

        return result.join('');
    }
}

export class PercentDirective implements DirectiveNode {

    constructor(public numericParameter = 1) {
        this.numericParameter = numericParameter;
    }

    run(): string {
        let result = [];

        for (let i = 0; i < this.numericParameter; i++) {
            result.push('\n');
        }

        return result.join('');
    }
}


export class RadixDirective implements DirectiveNode {

    constructor(public radix = 10,
        public mincol?: number,
        public padchar?: number,
        public commachar?: number,
        public commaInterval?: number) {
    }

    run(): string {
        return '';
    }
}

export class IterationDirective implements DirectiveNode {

    constructor(public directives: DirectiveNode[], public numericParemeter = 1,
        public columnModifier: boolean, public atSignModifier: boolean) {
    }

    run(): string {
        return '';
    }
}



function formatter(controlString: string) {
    const stream = ReadStream.on(controlString);
    const directives = [];

    while (!stream.atEnd()) {
        const next = stream.next;
        if (next === '~') {
            const k = stream.next;
            if (k === '~') {
                directives.push({
                    kind: '~'
                });
            }

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


function runDirectives(directives: DirectiveNode[]): string {
    return directives.map(d => d.run()).join('');
}

const tilde = [new TildeDirective(1), new PercentDirective(1), new TildeDirective(1)];

console.log(runDirectives(tilde));
