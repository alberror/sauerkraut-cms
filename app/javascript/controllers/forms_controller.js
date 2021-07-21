import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["submitButton", "contactForm", "noticeZone"];
  submitForm() {
    this.submitButtonTarget.click()
  }

  sendContactForm(event) {
    event.preventDefault();
    const form = this.contactFormTarget;
    const data = new FormData(form);
    const xhr = new XMLHttpRequest();
    xhr.open(form.method, form.action);
    xhr.setRequestHeader("Accept", "application/json");
    xhr.onreadystatechange = () => {
      if (xhr.readyState !== XMLHttpRequest.DONE) return;
      if (xhr.status === 200) {
        form.reset();
        this.noticeZoneTarget.innerHTML =
          '<div class="success flash">Merci pour votre message !</div>'
      } else {
        console.log('error')
        this.noticeZoneTarget.innerHTML =
          '<div class="error flash">Oups, une erreur s\'est produite...</div>';
      }
    };
    xhr.send(data);
  }
}
