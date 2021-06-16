require('ts-node').register();

// @ts-ignore
const rules = require('./index.ts').default;

module.exports = {
    rules: rules
}
