class ItemsController < ApplicationController
  before_action :set_item, only: [ :edit, :update, :destroy ]
  def index
    @items = current_user.items
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path, notice: "アイテムが作成されました"
    else
      @items = current_user.items  # ← エラー時に一覧も表示するため
      render :index  # ← indexテンプレートを再表示
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "アイテムが削除されました"
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "アイテムが更新されました"
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
