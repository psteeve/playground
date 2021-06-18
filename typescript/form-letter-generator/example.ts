import { stInterpol } from './form-letter-generator';


const template = `(:first-name %firstName :last-name "%lastName" :age %age)`;

const data = {
    firstName: 'paul',
    lastName: 'steevenson',
    age: 32,
    pseudo: 'psteeve'
};


console.log(stInterpol(template, data).text);
