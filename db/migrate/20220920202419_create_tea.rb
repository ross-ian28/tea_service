class CreateTea < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :title
      t.text :description
      t.integer :temperature
      t.integer :brew_time
    end
  end
end
