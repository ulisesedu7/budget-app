class CreatePaymentsCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :payments, :categories do |t|
      t.index :payment_id
      t.index :category_id

      t.timestamps
    end
  end
end
