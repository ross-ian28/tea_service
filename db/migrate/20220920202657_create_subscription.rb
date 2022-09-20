class CreateSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :price
      t.string :status
      t.string :frequency
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true
    end
  end
end
