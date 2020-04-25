/**
 * Applies the `js-nav-current` id to the child in element.
 */
export default function highlight(parentElement) {
  const navId = document.querySelector("[data-nav-id]").dataset.navId
  const navElement = findElementByInnerText(parentElement, navId, toSnakeCase)

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
