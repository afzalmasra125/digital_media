class CreateWatchlists < ActiveRecord::Migration[5.1]
  def change
    create_table :watchlists do |t|
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
