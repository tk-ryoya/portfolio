class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :content)
  end
end
