import { streamOn, peek, next } from 'flotjs';

const validInput = [
    'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l',
    'm', 'n', 'o', 'p', 'q', 'r',
    's', 't', 'u', 'v', 'w', 'x',
    'y', 'z', '_', '$', '0', '1',
    '2', '3', '4', '5', '6', '7',
    '8', '9'
];

export function stInterpol(template: string, data: Record<string, any>): { text: string; errors: string[] } {

    const stream = streamOn(template);

    const output: string[] = [];

    const errors: string[] = [];

    const interpol = () => {

        while (peek(stream) !== '%' && !stream.atEnd()) {
            output.push(next(stream));
        }

        next(stream);

        while (peek(stream) === '%') {
            output.push(next(stream));
        }

        if (stream.atEnd()) return;

        const property = [];

        while (validInput.includes(peek(stream)?.toLowerCase())) {
            property.push(next(stream));
        }

        // Test if i'ts a valid property name
        const propertyName = property.join('');

        if (!data.hasOwnProperty(propertyName)) {
            const name = propertyName || '"<Empty Field>"';

            errors.push(`${name} is not a property of ${JSON.stringify(data)} `);
            return;
        }

        output.push(data[propertyName]);

    }

    while (!stream.atEnd()) {
        interpol();
    }

    return { text: output.join(''), errors };
}
