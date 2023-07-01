import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-filter"
export default class extends Controller {
  static targets = ['checkbox']

  toggle() {
    const selectedValues = this.checkboxTargets
      .filter(checkbox => checkbox.checked)
      .map(checkbox => checkbox.value);

      let queryParams = new URLSearchParams(window.location.search);
      let newUrl = `${window.location.pathname}`

      if (selectedValues.length) {
        queryParams.set('category_ids[]', selectedValues);
      } else {
        queryParams.delete('category_ids[]')
      }

      if (queryParams.toString()) {
        newUrl = newUrl + `?${queryParams.toString()}`;
      }

      window.history.pushState(null, '', newUrl);
      this.element.requestSubmit()
  }
}
