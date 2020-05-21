// Displays years since some year and stick in the innerText of an element.

export default function since(elements) {
  Array.from(elements).forEach((e) => {
    var year = parseInt(e.dataset.since)
    e.innerText = new Date().getFullYear() - year
  })
}
