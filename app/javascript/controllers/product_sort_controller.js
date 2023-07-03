import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="product-sort"

export default class extends Controller {
  static targets = ["select"]

  update() {
    const sortBy = this.selectTarget.value;
    const url = `/products?sort=${sortBy}`;

    fetch(url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      },
    }).then((response) => response.text())
      .then((html) => {
        Turbo.renderStreamMessage(html)
      })
  }
}