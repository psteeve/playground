import { stInterpol } from './form-letter-generator';


const template = `%firstName %lastName %age`;

const data = {
    firstName: 'paul',
    lastName: 'steevenson',
    age: 32,
    pseudo: 'psteeve'
};



console.log(stInterpol(template, data));
