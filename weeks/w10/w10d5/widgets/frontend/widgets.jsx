import React from "react";
import { ReactDOM } from "react";
import Clock from './clock'

document.addEventListener("DOMContentLoaded", function (event) {
  console.log("DOM Content has been loaded");

  // const root = document.querySelector('#root');
  const root = document.getElementById('min');
	ReactDOM.render(< Root />, root);
})