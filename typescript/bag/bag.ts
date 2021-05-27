export class Bag {
    private _map = new Map<any, number>();
    private _size = 0;

    /*
     * Include the argument, value, as an element of the Bag
     * an occurrence number of times. Answer the argument, value.
     */
    public addWithOccurrences(value: any, occurences = 1): any {

        if (this._map.has(value)) {

            const oldOccurrences = this._map.get(value) as number;

            const n = oldOccurrences + occurences;

            this._size = n;

            this._map.set(value, n);

            return value;
        }

        this._size = this._size + occurences;

        this._map.set(value, occurences);

        return value;
    }

    public forEach(f: (value: any) => void): void {
        this._map.forEach((_, key) => {
            const occurrences = this._map.get(key) as number;

            for (let i = 0; i < occurrences; i++) {
                f(key);
            }
        });
    }

    public add(value: any): any {
        return this.addWithOccurrences(value);
    }

    public get size(): number {
        return this._size;
    }

    public occurrencesOf(value: any): number | undefined {
        return this._map.get(value);
    }

    public includes(value: any): boolean {
        return this._map.has(value);
    }

    public removeAll(): void {
        this._size = 0;
        this._map.clear();
    }

    /*
     * Remove the value in the Bag and answer the value if it's removed.
     * Or call ifAbsentCallBack function if the value is absent.
     * The default value is identity function for ifAbsentCallBack.
     */
    public remove(value: any, ifAbsentCallBack = (value: any) => value): any {
        if (this._map.has(value)) {
            this._map.delete(value);
            return value;
        }
        return ifAbsentCallBack(value);
    }
}
