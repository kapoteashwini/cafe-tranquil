module Admin
  class MenuItemsController < ApplicationController
    def index
      @menu_items = MenuItem.all
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

    private

    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :price,:image)
    end
  end
end
