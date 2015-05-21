class CreateNextPickNumbers < ActiveRecord::Migration
  def change
    create_table :next_pick_numbers do |t|
      t.string :gender
      t.integer :number

      t.timestamps
    end
  end
end
