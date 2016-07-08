class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
