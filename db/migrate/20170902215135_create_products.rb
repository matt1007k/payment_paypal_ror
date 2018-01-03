class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :pricing , scale: 2, precision: 10
      t.text :description
      t.references :user, foreign_key: true
      t.attachment :image
      t.timestamps
    end
  end
end
