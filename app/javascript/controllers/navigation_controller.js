// navigation_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "overlay", "hamburger"]
  
  connect() {
    // Event Listener für Escape-Taste
    this.boundHandleEscape = this.handleEscape.bind(this)
    document.addEventListener("keydown", this.boundHandleEscape)
  }
  
  disconnect() {
    document.removeEventListener("keydown", this.boundHandleEscape)
  }
  
  toggle() {
    const isOpen = this.menuTarget.classList.contains("is-open")
    
    if (isOpen) {
      this.close()
    } else {
      this.open()
    }
  }
  
  open() {
    this.menuTarget.classList.add("is-open")
    this.overlayTarget.classList.add("is-visible")
    this.hamburgerTarget.classList.add("is-active")
    
    // Verhindere Scrollen im Hintergrund
    document.body.style.overflow = "hidden"
  }
  
  close() {
    this.menuTarget.classList.remove("is-open")
    this.overlayTarget.classList.remove("is-visible")
    this.hamburgerTarget.classList.remove("is-active")
    
    // Erlaube wieder Scrollen
    document.body.style.overflow = ""
  }
  
  // Schließe bei Klick auf Overlay
  closeOnOverlay() {
    this.close()
  }
  
  // Schließe bei Escape-Taste
  handleEscape(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }
}
