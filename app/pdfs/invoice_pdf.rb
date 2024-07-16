require 'prawn'

class InvoicePdf < Prawn::Document
  def initialize(order)
    super()
    @order = order
    header
    text_content
    table_content
  end

  def header
    text "Invoice", size: 30, style: :bold
  end

  def text_content
    move_down 20
    text "Date: #{@order.created_at.strftime("%B %d, %Y")}", size: 15
    move_down 10
    text "Order ID: #{@order.id}", size: 15
  end

  def table_content
    move_down 20
    table(item_rows, header: true) do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
    end
  end

  def item_rows
    [["Item", "Quantity", "Price"]] +
      @order.items.map do |item|
        [item.name, item.quantity, item.price]
      end
  end
end
