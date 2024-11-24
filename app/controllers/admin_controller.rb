class AdminController < ApplicationController
  def index
    @orders = Order.all
  end

  def mark_as_served
    @order = Order.find(params[:id])
    if @order.update(status: 'Served')
      redirect_to admin_orders_path, notice: 'Order marked as served.'
    else
      redirect_to admin_orders_path, alert: 'Failed to update order status.'
    end
  end

  def mark_as_canceled
    @order = Order.find(params[:id])
    if @order.update(status: 'Canceled')
      redirect_to admin_orders_path, notice: 'Order marked as canceled.'
    else
      redirect_to admin_orders_path, alert: 'Failed to update order status.'
    end
  end

  def generate_invoice
    @order = Order.find(params[:id])
    # Add any logic needed to gather invoice details
    
    respond_to do |format|
      format.html # Render generate_invoice.html.erb
      format.pdf do
        pdf = InvoicePdf.new(@order) # Assuming you're using Prawn or some other PDF generation gem
        send_data pdf.render, filename: "invoice_#{@order.id}.pdf",
                              type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end


  
end
