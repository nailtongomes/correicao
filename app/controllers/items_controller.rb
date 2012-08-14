class ItemsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user
  before_filter :load_groups,  only: [:edit, :new]
    
  def show
    @item = @eyre.items.find(params[:id])    
  end

  def new
    @item = @eyre.items.build    
  end

  def edit
    @item = @eyre.items.find(params[:id])    
  end

  def update
    @item = @eyre.items.find(params[:id])    
    if @item.update_attributes(params[:item])
      flash[:success] = "Processo atualizado."
      redirect_to eyre_items_path(@eyre)
    else
      flash[:error] = "Erro!"
      render "edit"
    end
  end

  def create
    @item = @eyre.items.build(params[:item])
    if @item.save
      flash[:success] = "Processo inserido."      
    else
      flash[:error] = "Erro ao inserir processo..."
    end
    redirect_to :back
  end

  def destroy
    @item = @eyre.items.find(params[:id]).destroy
    flash[:success] = "Processo removido..."
    redirect_to eyre_items_path(@eyre)
  end
  
  private

  def correct_user
    @eyre = current_user.eyres.find_by_id(params[:eyre_id])    
    redirect_to root_path if @eyre.nil?
  end       
  
  def load_groups
    @groups = Group.all
  end         
end