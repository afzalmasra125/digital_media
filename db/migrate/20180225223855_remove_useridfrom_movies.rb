class RemoveUseridfromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :user_id, :integer
  end
end
