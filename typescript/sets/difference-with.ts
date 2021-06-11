export function differenceWith(
    list: ReadonlyArray<any>,
    list2: ReadonlyArray<any>,
    equalityFun: (val1: any, val2: any) => boolean = (a, b) => a === b
): ReadonlyArray<any> {
    const result = new Set();

    list.forEach(value => {
        let exist = false;
        list2.forEach(val => {
            if (equalityFun(value, val)) {
                exist = true;
            }
        });
        if (!exist) {
            result.add(value);
        }
    });

    return [...result];
}
