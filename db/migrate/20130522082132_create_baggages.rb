class CreateBaggages < ActiveRecord::Migration
  def change
    create_table :baggages do |t|
      t.references :player_one
      t.references :player_two
      t.string :pick_to_lose

      t.timestamps
    end
    add_index :baggages, :player_one_id
    add_index :baggages, :player_two_id
  end
end
