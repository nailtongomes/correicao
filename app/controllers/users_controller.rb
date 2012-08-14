class UsersController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Bem vindo!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit    
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Perfil atualizado."
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario removido."
    redirect_to users_path
  end
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Por favor, autentifique-se."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end