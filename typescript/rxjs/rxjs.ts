import { of, from, interval } from 'rxjs';

const observable = of([1, 2, 3]);
const ob = from([1, 2, 4]);

const inter = interval(100);

observable.subscribe(x => console.log(x));


ob.subscribe(x => console.log(x));


inter.subscribe(x => console.log(x));


