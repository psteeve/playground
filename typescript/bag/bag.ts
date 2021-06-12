/*
 * Include the argument, value, as an element of the Bag
 * an occurrence number of times. Answer the argument, value.
 */

export function addWithOccurrences(b: Bag, value: any, occurrences = 1): any {

    if (b._map.has(value)) {

        const oldOccurrences = b._map.get(value) as number;

        const n = oldOccurrences + occurrences;

        b._size = n;

        b._map.set(value, n);

        return value;
    }

    b._size = b._size + occurrences;

    b._map.set(value, occurrences);

    return value;
}

export function add(b: Bag, value: any): any {
    return addWithOccurrences(b, value);
}

export function occurrencesOf(b: Bag, value: any): number | undefined {
    return b._map.get(value);
}

/*
 * Remove the value in the Bag if occurrences is 1 otherwise decrement occurrences.
 * Or call ifAbsentCallBack function if the value is absent.
 * The default value is identity function for ifAbsentCallBack.
 */
export function remove(b: Bag, value: any, ifAbsentCallBack = (value: any) => value): any {
    if (b._map.has(value)) {
        const oldOccurrences = b._map.get(value) as number;

        if (oldOccurrences === 1) {
            b._map.delete(value);
            b._size = 0;
            return value;
        }

        b._map.set(value, oldOccurrences - 1);
        b._size = b._size - 1;

        return value;

    }
    return ifAbsentCallBack(value);
}

export function includes(b: Bag, value: any): boolean {
    return b._map.has(value);
}

export function removeAll(b: Bag): void {
    b._size = 0;
    b._map.clear();
}

export function forEach(b: Bag, f: (value: any) => void): void {
    b._map.forEach((_, key) => {
        const occurrences = b._map.get(key) as number;

        for (let i = 0; i < occurrences; i++) {
            f(key);
        }
    });
}

export class Bag {
    public _map = new Map<any, number>();
    public _size = 0;

    public get size(): number {
        return this._size;
    }
}
