class FuneralsController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_funeral, only: [:show, :edit, :update, :destroy]

  def index
    @funeral_hash = Funeral.most_popular_funeral_home
    @total_count_of_funerals = Funeral.total_count_of_funerals
    @total_count_of_users = User.total_count_of_users
    @disposition_by_religion = User.most_popular_dispositions_by_religion
    @religion_hash = User.religion_hash
    @service_type_hash = Funeral.service_type_count
    @service_type_religion = Funeral.service_type_by_religion
    @disposition_hash = Funeral.disposition_count
    @service_type_disposition = Funeral.service_type_by_disposition
  end

  def new
    @funeral = Funeral.new
    @user = User.find(session[:user_id])
  end

  def create
    @funeral = Funeral.new(funeral_params)
    if @funeral.update(funeral_params)
      @funeral.user = User.find(session[:user_id])
      redirect_to user_funeral_path(params[:user_username], @funeral)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @funeral.update(funeral_params)
      redirect_to user_funeral_path(@user, @user.funeral)
    else
      render :edit
    end
  end

  def destroy
    @funeral.destroy
    flash[:notice] = "Your funeral preferences have been deleted."
    redirect_to user_path(session[:user_id])
  end


  private

  def funeral_params
    params.require(:funeral).permit(
        :disposition, :disposition_expand,
        :officiant, :officiant_expand,
        :eulogist_1, :eulogist_2, :eulogist_expand,
        :service_type, :service_type_expand,
        :religion_id, :religion_expand,
        :funeral_home_id, :funeral_home_expand,
        :financial_plan, :financial_plan_expand,
        :general_expand,
        funeral_home_attributes: [:name, :phone, :address])
  end

  def find_funeral
    @user = User.find(session[:user_id])
    @funeral = @user.funeral
  end

end
