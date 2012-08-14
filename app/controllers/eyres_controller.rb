class EyresController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: [:destroy, :show]
  
  def show    
    @groups = Group.all
  end

  def create
    @eyre = current_user.eyres.build(params[:eyre])
    if @eyre.save
      flash[:success] = "Correicao criada."
      redirect_to root_path
    else
      flash[:error] = "Falha ao criar correicao."
      render 'static_pages/home'
    end
  end

  def destroy
    @eyre.destroy
    flash[:success] = "Correicao removida."
    redirect_back_or root_path
  end

  private

  def correct_user
    @eyre = current_user.eyres.find_by_id(params[:id])
    redirect_to root_path if @eyre.nil?
  end     
end