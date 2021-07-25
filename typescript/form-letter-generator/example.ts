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

function processKeywordFormat(stream: ReadStream) {
    const recur: (result: any[], isAtEnd: boolean) => any[] = (result: any[], isAtEnd: boolean) => {
        if (isAtEnd) {
            return result;
        } else {
            result.push(upTo(stream, ":"));
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