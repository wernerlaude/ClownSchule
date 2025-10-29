class ContactsController < ApplicationController
  # rate_limit to: 3, within: 1.hour, only: :create
  def new
    @contact = Contact.new
    @contact.textcaptcha
  end

  # POST /members or /members.json
  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.valid?
        NoticeMailer.with(contact: @contact).notice_email.deliver_now
        format.html { redirect_to contact_success_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def success; end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :telefon, :betreff, :message, :textcaptcha_answer, :textcaptcha_key)
  end
end
