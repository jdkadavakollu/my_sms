class ContactsController < ApplicationController

  def index
    @contacts = Contact.all.page(params[:page]).per(10)
    @contact = Contact.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @contact = Contact.new
  end

  def show
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to :back
    else
      render @contact
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :mobile, :group_id)
  end
end
