class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :seller_email
      t.string :buyer_email
      t.string :guid
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
