class Books < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    t.column :title, :string
    t.column :description, :text
    t.column :producer, :string
    t.column :price, :decimal

    t.timestamps
    end
  end
end
