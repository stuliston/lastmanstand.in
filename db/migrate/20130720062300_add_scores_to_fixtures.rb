class AddScoresToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :home_score, :integer
    add_column :fixtures, :away_score, :integer
  end
end
