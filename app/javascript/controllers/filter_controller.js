import { Controller } from "@hotwired/stimulus"
import debounce from "debounce"

// Connects to data-controller="checkbox-filter"
export default class extends Controller {
  static targets = ['checkbox', 'input', 'select']
  initialize(){
    this.range = debounce(this.range.bind(this), 1000)
  }

  range(){
    const minPriceField = this.inputTargets.find(field => field.id == 'query_price_gteq')
    const maxPriceField = this.inputTargets.find(field => field.id == 'query_price_lteq')

    let queryParams = new URLSearchParams(window.location.search)
    let newUrl = `${window.location.pathname}`

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

  toggle() {
    const selectedCheckboxValues = this.checkboxTargets
      .filter(checkbox => checkbox.checked)
      .map(checkbox => checkbox.value);

      let queryParams = new URLSearchParams(window.location.search);
      let newUrl = `${window.location.pathname}`

      queryParams.delete('query[category_id_eq]')

      if (selectedCheckboxValues.length) {
        queryParams.set('query[category_id_in][]', selectedCheckboxValues);
      } else {
        queryParams.delete('query[category_id_in][]')
      }

      if (queryParams.toString()) {
        newUrl = newUrl + `?${queryParams.toString()}`;
      }

      window.history.pushState(null, '', newUrl);
      this.element.requestSubmit()
  }

  update() {
    const sortBy = this.selectTarget.value;

    let queryParams = new URLSearchParams(window.location.search);
    let newUrl = `${window.location.pathname}`

    if (sortBy) {
      queryParams.set('query[s]', sortBy)
    } else {
      queryParams.delete('query[s]')
    }

    if (queryParams.toString()) {
      newUrl = newUrl + `?${queryParams.toString()}`;
    }

    window.history.pushState(null, '', newUrl);
    this.element.requestSubmit()

  }
}
