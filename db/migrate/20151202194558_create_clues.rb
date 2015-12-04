class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.string :category_id
      t.boolean :unrevealed
      t.integer :value
      t.boolean :right
      t.boolean :wrong
      t.boolean :no_resp

      t.timestamps

    end
  end
end
