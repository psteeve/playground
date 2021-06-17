class Person { };

class Job { };


function defineGeneric(name, implementation): (arg: unknown) => unknown {
    return () => implementation
}


defineGeneric('f', (arg: Person) => {

});


defineGeneric('f', (arg: Job) => {

});

function applyGeneric(name): (arg: unknown) => unknown {
    return (arg: unknown) => { };
}


applyGeneric('f',)
