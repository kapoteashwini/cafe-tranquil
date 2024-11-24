class AddTableNumberToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :table_number, :integer
  end
end
