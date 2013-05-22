class CreateBaggages < ActiveRecord::Migration
  def change
    create_table :baggages do |t|
      t.references :player1
      t.references :player2
      t.string :pick_to_lose

      t.timestamps
    end
    add_index :baggages, :player1_id
    add_index :baggages, :player2_id
  end
end
