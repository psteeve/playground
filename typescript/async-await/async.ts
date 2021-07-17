//function hello() { return "Hello"; };


//async function hello() { return "Hello"; };

//let hello = async function() { return "Hello"; };

//let hello = async () => { return "Hello"; };

async function hello() {
    const greeting = await Promise.resolve("Hello");
    return greeting;
}

console.log(hello());

hello().then(console.log);
