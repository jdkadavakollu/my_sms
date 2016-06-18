class ContactsController < ApplicationController
  before_action :add_default_breadcrumb

  def index
    @contacts = Contact.accessible_by(current_ability).page(params[:page]).per(10)
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
    @contact.user_id = current_user.id
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
