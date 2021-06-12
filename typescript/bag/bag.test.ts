import {
    Bag, addWithOccurrences,
    add, occurrencesOf,
    remove, includes,
    removeAll
} from './bag';

test('addWithOccurences', () => {
    const sack = new Bag();

    addWithOccurrences(sack, 'paul', -1);

    expect(sack.size).toBe(-1);

    addWithOccurrences(sack, 'toto', 20);

    expect(sack.size).toBe(19);
});

test('add', () => {
    const sack = new Bag();

    add(sack, 'paul');

    expect(sack.size).toBe(1);

    add(sack, 'paul');

    expect(sack.size).toBe(2);
});


test('occurrencesOf', () => {
    const sack = new Bag();

    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');

    expect(occurrencesOf(sack, 'paul')).toBe(4);

    add(sack, 'paul');

    expect(occurrencesOf(sack, 'paul')).toBe(5);
});


test('removeAll', () => {
    const sack = new Bag();

    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');

    removeAll(sack);
    expect(sack.size).toBe(0);
});


test('remove', () => {
    const sack = new Bag();

    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');

    remove(sack, 'paul');
    expect(occurrencesOf(sack, 'paul')).toBe(3);
    expect(remove(sack, 't', () => 'absent')).toBe('absent');

});


test('includes', () => {
    const sack = new Bag();

    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');
    add(sack, 'paul');

    expect(includes(sack, 'paul')).toBe(true);

    expect(includes(sack, 't')).toBe(false);
});
