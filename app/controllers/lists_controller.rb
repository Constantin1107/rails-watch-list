class ListsController < ApplicationController
  before_action :set_list, only: %i[destroy show]
  def index
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    @list.save
    redirect_to list_path(@list.id)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
