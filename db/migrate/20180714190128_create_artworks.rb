class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.integer :accession_date
      t.integer :year_installed
      t.string :title
      t.string :artist
      t.string :material
      t.string :location
      t.string :detailed_location
      t.text   :notes
      t.integer :point_x
      t.integer :point_y
      t.string :globalid

      t.timestamps
    end
  end
end
