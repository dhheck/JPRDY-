class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :game_type
      t.date :date

      t.timestamps

    end
  end
end
