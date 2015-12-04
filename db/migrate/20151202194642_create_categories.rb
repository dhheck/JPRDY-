class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :clue
      t.string :theme
      t.string :round_id

      t.timestamps

    end
  end
end
