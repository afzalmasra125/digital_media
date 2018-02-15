class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :summary
      t.string :actor
      t.integer :rating
      t.string :genre
      t.string :content_url

      t.timestamps
    end
  end
end
