class AddDrawToFixture < ActiveRecord::Migration
  def change
    add_column :fixtures, :draw, :boolean, default: false
  end
end
