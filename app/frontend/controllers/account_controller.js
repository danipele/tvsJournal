import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['input']

    reveal_input(event) {
        this.inputTargets.forEach(input => {
            if (input !== event.target) {
                input.classList.add('account-info-input')
            } else {
                input.classList.remove('account-info-input')
            }
        })
    }
}
