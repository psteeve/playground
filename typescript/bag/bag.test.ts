import { Bag } from './bag';


const sack = new Bag();

sack.addWithOccurrences('paul', 10);
sack.addWithOccurrences('steevenson', 10);

sack.remove('paul');

sack.remove('pa');
sack.remove('steevenson');

console.log(sack);
