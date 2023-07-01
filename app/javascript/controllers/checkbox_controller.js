import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-filter"
export default class extends Controller {
  toggle() {
    this.element.requestSubmit()
  }
}
