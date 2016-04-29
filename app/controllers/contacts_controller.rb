class ContactsController < ApplicationController

  def index
    @contacts = Contact.all.page(params[:page]).per(10)
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
  end
end
