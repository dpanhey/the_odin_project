"use strict";
const container = document.querySelector("#container");

const pElement = document.createElement("p");
pElement.textContent = "Hey I'm red!";
pElement.setAttribute("style", "color: red");

const h3Element = document.createElement("h3");
h3Element.textContent = "I'm a blue h3!";
h3Element.setAttribute("style", "color: blue");

const divElement = document.createElement("div");
divElement.setAttribute("style", "border: solid 5px black; background-color: pink")

const h1Element =document.createElement("h1");
h1Element.textContent = "I'm in a div!";

const pElement2 = document.createElement("p");
pElement2.textContent = "ME TOO!";

divElement.appendChild(h1Element);
divElement.appendChild(pElement2);

container.appendChild(pElement);
container.appendChild(h3Element);
container.appendChild(divElement);

function alertFunction() {
    alert("Hello World!");
}

const btn = document.querySelector("#btn");
btn.onclick = alertFunction;

const btn1 = document.querySelector("#btn1");
btn1.addEventListener("dblclick", alertFunction)

const btn2 = document.querySelector("#btn2");
btn2.addEventListener("mouseover", e => {
// btn2.addEventListener("click", function(e) { --- gleiche Schreibweise ---
    console.log(e);
    console.log(e.target);
    e.target.style.background = "blue";
})

const btn3 = document.querySelector("#btn3");
btn3.addEventListener("click", e => {
// btn2.addEventListener("click", function(e) { --- gleiche Schreibweise ---
    console.log(e.target);
    e.target.style.background = "red";
})