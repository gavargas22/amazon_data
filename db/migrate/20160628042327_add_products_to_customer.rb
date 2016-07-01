class AddProductsToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :products, index: true, foreign_key: true
  end
end
