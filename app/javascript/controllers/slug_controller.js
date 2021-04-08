import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["slug"];

  fillSlug(event) {
    let value = event.target.value.toLowerCase();
    const regexes = [
      {
        regex: /[\s]/g,
        replacement: "-"
      },
      {
        regex: /[\"\,\'\[\]\(\)\{\}(\s\.)(\s\!)(\s\?)]/g,
        replacement: ""
      },
      {
        regex: /[\"\,\'\[\]\(\)\{\}]/g,
        replacement: ""
      },
      {
        regex: /[àâä]/g,
        replacement: "a"
      },
      {
        regex: /[éèêë]/g,
        replacement: "e"
      },
      {
        regex: /[îï]/g,
        replacement: "i"
      },
      {
        regex: /[ôö]/g,
        replacement: "o"
      },
      {
        regex: /[ùûü]/g,
        replacement: "u"
      },
      {
        regex: /[ç]/g,
        replacement: "c"
      },
    ];
    regexes.forEach((({regex, replacement}) => value = value.replace(regex, replacement)));
    this.slugTarget.value = value;
  };
};
