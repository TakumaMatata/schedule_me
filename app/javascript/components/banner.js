import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Schedule smart", "Work smart"],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
