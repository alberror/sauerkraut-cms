import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  toggle() {
    this.contentTargets.map((target) => target.classList.toggle(this.data.get("class")));
  };
};
