import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="appointments"
export default class extends Controller {
  static targets = ["start_time"];
  static values = {
    url: String
  }
  change(event){
    let day = event.target.selectedOptions[0].value;
    let target = this.start_timeTarget.id;
    let url = this.urlValue;

    get(`${url}?target=${target}&day=${day}`, {
      responseKind: "turbo-stream"
    })
  }
  connect() {
    if (this.startTimeSelectTarget === "") {
      this.startTimeSelectTarget = Math.random().toString(36)
    }
    console.log("Appointments Controller connected");
  }
}
