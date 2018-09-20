class ContactsController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.where(user_id: session[:user_id])
    @user = User.find(session[:user_id])
  end

  def new
    @contact = Contact.new
    @user = User.find(session[:user_id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = session[:user_id]
    if @contact.save
      redirect_to user_contacts_path(@contact.user)
    else
      flash[:notice] = "Contact must have name and valid email address."
      redirect_to new_user_contact_path(@contact.user, @contact)
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
    if @contact.user == @user
      render :edit
    else
      flash[:notice] = "Not a valid contact."
      redirect_to user_contacts_path
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to user_contacts_path
    else
      render "edit"
    end
  end

  def destroy
    @contact.destroy

    redirect_to user_contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_username)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

end
