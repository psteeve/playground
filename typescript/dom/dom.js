"use strict";
function setStyle(element, styleSpecs) {
    Object.keys(styleSpecs)
        .forEach(function (key) {
            var style = element.style;
            style[key] = styleSpecs[key];
        });
}
function createElement(elementName, value, styleSpecs, eventHandlersSpecs) {
    var element = document.createElement(elementName);
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
function setEventHandlers(element, eventHandlerSpecs) {
    Object.keys(eventHandlerSpecs)
        .forEach(function (event) {
            var e = element;
            e[event] = eventHandlerSpecs[event];
        });
}
function countClick() {
    var count = 0;
    return function () {
        count = count + 1;
        return count;
    };
}
window.onload = function () {
    var counter = countClick();
    var h1 = createElement('h1', "testing", {
        fontSize: "3rem",
        color: "blue",
        textAlign: "center",
        backgroundColor: "black"
    }, {
        onclick: function () {
            console.log(counter());
        }
    });
    var input = createElement('input', '', {}, {
        oninput: function (_event) {
            console.log(counter());
        }
    });
    var body = document.body;
    body.append(h1);
    body.append(input);
};
