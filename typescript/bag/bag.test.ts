import { Bag } from './bag';


const sack = new Bag();


//sack.addWithOccurrences('paul', 20);
sack.addWithOccurrences('steevenson');

console.log(sack.occurrencesOf('steeven'));

console.log(sack.includes('steevens'));

console.log(sack.remove('paul'));
console.log(sack.remove('paul', (_value) => "toto" + _value));

sack.removeAll();
console.log(sack.size);

console.log(sack);
console.log(sack);
