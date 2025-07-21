class WidgetRating extends HTMLElement {
  static observedAttributes = [ "rating" ]

  attributeChangedCallback(name, oldValue, newValue) {
    if (name != "rating") return
    const message = this.querySelector("[role=status]")
    if (!message) return

    const slot = message.querySelector("slot[name=rating]")
    slot.textContent = newValue
  }
  connectedCallback() {
    console.log("connectedCallback")
    this.querySelectorAll("form").forEach((form) => {
      console.log("form", form)
      form.addEventListener("submit", this.#submitRating)
    })
  }

  #submitRating = (event) => {
    event.preventDefault()

    const form = event.target
    const formData = new FormData(form)
    const urlSearchParams = new URLSearchParams(formData)

    const request = new Request(form.action, {
      method: form.method,
      body: urlSearchParams,
    })

    fetch(request).then((response) => {
      if (response.ok) {
        const rating = formData.get("rating")
        this.setAttribute("rating", rating)
      } else {
        console.error("Error: %o", response)
      }
    })
  }
}

export default WidgetRating
