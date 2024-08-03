# app/controllers/admin/menu_items_controller.rb
class Admin::MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index
    @menu_items = MenuItem.all
  end

  def show
  @menu_item = MenuItem.find(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @menu_item }
  end
end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to admin_menu_items_path, notice: 'Menu item was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to admin_menu_items_path, notice: 'Menu item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to admin_menu_items_path, notice: 'Menu item was successfully deleted.'
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price, :image)
  end
end
