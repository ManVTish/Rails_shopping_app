import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-filter"
export default class extends Controller {
  static targets = ['checkbox', 'input']

  toggle() {
    const selectedCheckboxValues = this.checkboxTargets
      .filter(checkbox => checkbox.checked)
      .map(checkbox => checkbox.value);

      const minPriceField = this.inputTargets.find(field => field.id == 'query_price_gteq')
      const maxPriceField = this.inputTargets.find(field => field.id == 'query_price_lteq')

      let queryParams = new URLSearchParams(window.location.search);
      let newUrl = `${window.location.pathname}`

      queryParams.delete('query[category_id_eq]')

      if (selectedCheckboxValues.length) {
        queryParams.set('query[category_id_in][]', selectedCheckboxValues);
      } else {
        queryParams.delete('query[category_id_in][]')
      }

      if (minPriceField.value.length) {
        queryParams.set('query[price_gteq]', minPriceField.value)
      } else {
        queryParams.delete('query[price_gteq]')
      }

      if (maxPriceField.value.length) {
        queryParams.set('query[price_lteq]', maxPriceField.value)
      } else {
        queryParams.delete('query[price_lteq]')
      }

      if (queryParams.toString()) {
        newUrl = newUrl + `?${queryParams.toString()}`;
      }

      window.history.pushState(null, '', newUrl);
      this.element.requestSubmit()
  }

  disconnect() {
    let queryParams = new URLSearchParams(window.location.search);
    queryParams.delete('category_ids[]')
  }
}
