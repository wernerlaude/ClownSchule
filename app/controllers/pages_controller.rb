class PagesController < ApplicationController
  def index
  end
  def workshops
  end

  def fragen
    @contact = Contact.new
    @contact.textcaptcha
  end

  def about
  end

  def impressum
  end

  def datenschutz
  end
end
