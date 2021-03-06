class CreateReviews < ActiveRecord::Migration

  
  def change
    create_table :reviews do |t|
      t. string :name
      t.integer :product_id
      t.integer :user_id
      t.string :description
      t.integer :rating
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
