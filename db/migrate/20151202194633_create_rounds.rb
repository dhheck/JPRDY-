class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :game_id
      t.string :category

      t.timestamps

    end
  end
end
