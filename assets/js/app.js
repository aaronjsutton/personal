import css from "../css/app.css"

import "phoenix_html"
import setCurrent from "./current-nav"
import since from "./since"

window.addEventListener('DOMContentLoaded', (event) => {
  const nav = document.getElementById('js-nav-highlight')

  if (nav) {
    setCurrent(nav)
  }

  var elements = document.querySelectorAll('[data-since]')
  since(elements)
});
