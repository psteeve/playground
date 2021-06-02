function setStyle(element: HTMLElement, styleSpecs: { [index: string]: string }) {
    Object.keys(styleSpecs)
        .forEach((key: string) => {
            const style = element.style as unknown as { [index: string]: string };
            style[key] = styleSpecs[key];
        });
}

function createElement(elementName: string,
    value?: string,
    styleSpecs?: { [index: string]: string },
    eventHandlersSpecs?: { [index: string]: (event?: Event) => void }) {

    const element = document.createElement(elementName);

    if (value) {
        element.innerText = value;
    }

    if (styleSpecs) {
        setStyle(element, styleSpecs);
    }


    if (eventHandlersSpecs) {
        setEventHandlers(element, eventHandlersSpecs);
    }


    return element;
}


function setEventHandlers(element: HTMLElement,
    eventHandlerSpecs: { [index: string]: (event?: Event) => void }) {
    Object.keys(eventHandlerSpecs)
        .forEach((event: string) => {
            const e = element as unknown as { [index: string]: (event?: Event) => void };

            e[event] = eventHandlerSpecs[event];
        });
}

function countClick() {
    let count = 0;
    return () => {
        count = count + 1
        return count;
    }
}

window.onload = () => {
    const counter = countClick();

    const h1 = createElement('h1', "testing",
        {

            fontSize: "3rem",
            color: "blue",
            textAlign: "center",
            backgroundColor: "black"
        },
        {
            onclick: () => {
                console.log(counter())
            }
        });

    const input = createElement('input', '', {
    }, {
            oninput: (_event?: Event) => {
                console.log(counter())
            }
        });

    const body = document.body;

    body.append(h1);
    body.append(input);
}

