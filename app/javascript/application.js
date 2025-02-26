// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"

import "confetti"
import "main"
import AOS from 'aos';

document.addEventListener('turbo:load', () => { AOS.init() });
document.addEventListener("turbo:frame-missing", (event) => {
    const { detail: { response, visit } } = event;
    event.preventDefault();
    visit(response.url);
});

var popover = new bootstrap.Popover(document.querySelector('.example-popover'), {
    container: 'body'
})
