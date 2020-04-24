import css from "../css/app.css"

import "phoenix_html"
import highlight from "./highlight-nav"

window.addEventListener('DOMContentLoaded', (event) => {
  const nav = document.getElementById('js-nav-highlight')

  if (nav) {
    highlight(nav)
  }
});
