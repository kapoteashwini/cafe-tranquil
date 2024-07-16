class OrdersController < ApplicationController
  before_action :get_menu_item
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @menu_items = MenuItem.all
  end

  def create
    @order = Order.new(order_params)
    @order.status = 'Received'
    @order.user = User.last
    
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    redirect_to @order
  end

  def mark_as_served
    @order = Order.find(params[:id])
    @order.update(status: 'Served')
    redirect_to admin_index_path
  end

  def generate_invoice
    @order = Order.find(params[:id])
    @order.update(status: 'Invoice Raised')
    redirect_to admin_index_path
  end

  private

  def order_params
    params.require(:order).permit(:table_number, order_items_attributes: [:menu_item_id, :quantity])
  end

  def get_menu_item
     @menu_items = MenuItem.all
  end
end
