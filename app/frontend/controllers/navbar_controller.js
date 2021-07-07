import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['button']

    hover_button(event) {
        const hovered_button = event.currentTarget
        this.buttonTargets.forEach(button => {
            if (button !== hovered_button) {
                button.classList.add('unhovered-btn')
            }
        })
    }

    unhover_button(event) {
        const hovered_button = event.currentTarget
        this.buttonTargets.forEach(button => {
            if (button !== hovered_button) {
                button.classList.remove('unhovered-btn')
            }
        })
    }
}
