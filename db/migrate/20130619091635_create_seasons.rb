class CreateSeasons < ActiveRecord::Migration
  def change
    create_table  :seasons do |t|
      t.integer   :competition_id
      t.string    :name
      t.date      :start_date
      t.date      :end_date
      t.timestamps
    end
  end
end
