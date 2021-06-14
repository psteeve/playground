import { format } from './format-with';
import { createReadStream, writeFileSync } from 'fs';
import { normalize } from 'path';
import { createInterface, Interface } from 'readline';
import { PositionableStream, upTo, upToEnd } from 'flotjs';

function getCity(stream: PositionableStream): any {
    const value = upTo(stream, '(');

    return (value as string).trim();
}

function getCodePostal(stream: PositionableStream): any {
    return upTo(stream, ')');
}

function getNameMaire(stream: PositionableStream): any {
    upTo(stream, '-');
    const value = upToEnd(stream)
    return (value as string).trim();
}


const outname = `out-${Date.now()}.json`;

const filename = process.env.npm_config_f
    ? normalize(process.env.npm_config_f)
    : // tslint:disable-next-line:no-magic-numbers
    process.argv[2];

const rl: Interface = createInterface({
    input: createReadStream(filename),
    output: process.stdout,
    terminal: false
});

const datas: Record<string, unknown>[] = [];

rl.on('line', line => {
    datas.push(format(line, {
        ville: getCity,
        maire: getNameMaire,
        codePostal: getCodePostal
    }));
});

rl.on('close', () => {
    writeFileSync(`./${outname}`, JSON.stringify(datas));
    // tslint:disable-next-line:no-console
    console.log(`Formating ${filename} to ${outname}`);
})
