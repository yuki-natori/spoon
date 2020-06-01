class ItemsController < ApplicationController
  before_action :set_item, except: [:new, :create, :edit]
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :description,
      images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
