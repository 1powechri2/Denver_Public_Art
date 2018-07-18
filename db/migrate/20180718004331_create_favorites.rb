class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :rating
      t.string :comment
      t.references :user, foreign_key: true
      t.references :artwork, foreign_key: true
    end
  end
end
