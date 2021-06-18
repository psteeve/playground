import { createReadStream, writeFileSync } from 'fs';
import { normalize } from 'path';
import { createInterface, Interface } from 'readline';
import { streamOn, upTo, upToEnd } from 'flotjs';

import { stInterpol } from 'form-letter-generator';

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

    const stream = streamOn(line);

    const city = (upTo(stream, '(') as string).trim();

    const codePostal = upTo(stream, ')');

    upTo(stream, '-');

    const maire = (upToEnd(stream) as string).trim();

    datas.push({
        city,
        maire,
        codePostal
    });
});

const template = `ville : %city maire: %maire codePostal: %codePostal`;

rl.on('close', () => {
    const data = datas.map(data => stInterpol(template, data).text).join('\n');
    writeFileSync(`./${outname}`, data);
    //    writeFileSync(`./${outname}`, JSON.stringify(datas));
    // tslint:disable-next-line:no-console
    console.log(`Formating ${filename} to ${outname}`);
})
