class AddUserToOrders < ActiveRecord::Migration[7.0]
  def change
    # add_reference :orders, :user, null: false, foreign_key: true
  end
end
