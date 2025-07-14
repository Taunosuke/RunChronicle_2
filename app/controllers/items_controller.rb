class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: "Item was successfully created."
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: "Item was successfully deleted."
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item = Item.update(item_params)
      redirect_to @item
    else
      render
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
