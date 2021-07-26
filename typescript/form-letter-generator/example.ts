import { ReadStream, streamOn, upTo } from 'flotjs';
import { stInterpol } from './form-letter-generator';




const template = `(:first-name %firstName :last-name "%lastName" :age %age)`;

const data = {
    firstName: 'paul',
    lastName: 'steevenson',
    age: 32,
    pseudo: 'psteeve'
};


console.log(stInterpol(template, data).text);

const s = streamOn(":nom paul :prenom steevenson :naissance 21/01/1989");

function processKeywordFormat(stream: ReadStream): string[] {
    const recur: (result: string[], isAtEnd: boolean) => string[] = (result: string[], isAtEnd: boolean) => {
        if (isAtEnd) {
            return result;
        } else {
            result.push(upTo(stream, ":") as string);
            return recur(result, s.atEnd());
        }
    }

    return recur([], stream.atEnd());
}

type Enfant = {
    nom: string;
    prenom: string;
    naissance: string;
}

function parseEnfant(stream: ReadStream): Record<string, string> {
    return processKeywordFormat(stream)
        .filter(value => value !== '')
        .map(value => {
            const splited = value.split(' ');
            return {
                [splited[0]] : splited[1]
            };
        })
        .reduce((acc: Record<string, string>, object: Record<string, string>) => {
            Object.keys(object)
                .forEach(key => {
                    acc[key] = object[key];
                });
            return acc;
        }, {} as Record<string, string>);
}

console.log(parseEnfant(s));
