class AddTotalAmountAndPaymentStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total_amount, :float
    add_column :orders, :payment_status, :string
  end
end
