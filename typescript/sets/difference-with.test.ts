import { differenceWith } from './difference-with';

describe.only('differenceWith', () => {
    it('should use the default comporator', () => {
        // tslint:disable-next-line:no-magic-numbers
        expect(differenceWith([1, 2, 3], [3, 2, 1, 4])).toEqual([]);
        // tslint:disable-next-line:no-magic-numbers
        expect(differenceWith([1], [3, 2, 1, 4])).toEqual([]);
        // tslint:disable-next-line:no-magic-numbers
        expect(differenceWith([3, 2, 1, 4], [1])).toEqual([3, 2, 4]);
    });
    it('should give the value of the list that is not empty or empty list if the first one is empty', () => {
        expect(differenceWith([], [])).toEqual([]);

        // tslint:disable-next-line:no-magic-numbers
        expect(differenceWith([1, 2, 3], [])).toEqual([1, 2, 3]);

        // tslint:disable-next-line:no-magic-numbers
        expect(differenceWith([], [3, 2, 1, 4])).toEqual([]);
    });

    it('should give the difference between two non empty lists', () => {
        expect(
            differenceWith(
                [{ key: 1 }, { key: 3 }],
                [{ key: 1 }, { key: 4 }],
                (o1, o2) => o1.key === o2.key
            )
        ).toEqual([{ key: 3 }]);

        expect(
            differenceWith(
                [{ key: 1 }],
                [{ key: 1 }, { key: 4 }],
                (o1, o2) => o1.key === o2.key
            )
        ).toEqual([]);
    });
});
