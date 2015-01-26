class AddRankingColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ranking, :integer, :null => false, :default => 999
  end
end
