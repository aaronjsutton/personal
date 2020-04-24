/**
 * Applies the `js-nav-current` id to the child in element.
 */
export default function highlight(parentElement) {
  const navElement = findElementByInnerText(parentElement, document.body.id, toSnakeCase)

  if (navElement) {
    navElement.lastChild.id = "js-nav-current"
  }
}

function findElementByInnerText(parentElement, text, f) {
  return Array.from(parentElement.children).find(element => {
    return text === f(element.lastChild.innerText)
  })
}

function toSnakeCase(element) {
  return element.toLowerCase().replace(" ", "-")
}
