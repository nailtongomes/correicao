class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.new
  end

  def create
    @group = Group.create(params[:group])
    if @group.save
      flash[:success] = "Classe criada com sucesso."
      redirect_to groups_path
    else
      flash[:error] = "Erro ao criar a classe..."
      @groups = []
      render "index"
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Classe removida..."
    redirect_to groups_path
  end
end
