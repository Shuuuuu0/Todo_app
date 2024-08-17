import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox"];

  connect() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.addEventListener("change", (event) => {
        if (event.target.checked) {
          console.log("Checkbox checked. Submitting form.");
          const form = event.target.closest("form");
          if (form) {
            form.submit();
          }
        }
      });
    });
  }
}
