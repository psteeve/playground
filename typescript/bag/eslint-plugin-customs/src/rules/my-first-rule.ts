import { Rule } from 'eslint';

const rule: Rule.RuleModule = {
    create: (context: Rule.RuleContext) => {
        return {
            VariableDeclarator: (node) => {
                if (node.id.type === 'Identifier' && node.id.name !== 'toto') {
                    context.report({
                        node,
                        message: 'All variable should be named "toto" !'
                    })
                }
            }

        }
    }
}

export default rule;
