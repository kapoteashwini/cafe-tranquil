class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_menu_item, only: [:new, :create]
  before_action :set_order, only: [:show, :update, :mark_as_served, :generate_invoice]

  def index
    all_orders  = current_user.role=="admin"? Order.all : current_user.orders
    @orders = all_orders.includes(order_items: :menu_item)
  end

  def new
    @order = Order.new
    @menu_items = MenuItem.all
  end

  def create
    @order = Order.new(order_params)
    @order.status = 'Received'
    @order.user = current_user

    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def show
  end

  def update
    if @order.update(status: params[:status])
      redirect_to @order
    else
      render :show
    end
  end

  def mark_as_served
    @order.update(status: 'Served')
    redirect_to admin_index_path, notice: 'Order marked as served.'
  end

  def generate_invoice
    @order.update(status: 'Invoice Raised')
    redirect_to admin_index_path, notice: 'Invoice generated.'
  end

  private

  def order_params
    params.require(:order).permit(:table_number, order_items_attributes: [:menu_item_id, :quantity])
  end

  def get_menu_item
    @menu_items = MenuItem.all
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
