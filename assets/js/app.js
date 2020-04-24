import css from "../css/app.css"

import "phoenix_html"
import setCurrent from "./current-nav"

window.addEventListener('DOMContentLoaded', (event) => {
  const nav = document.getElementById('js-nav-highlight')

  if (nav) {
    setCurrent(nav)
  }
});
