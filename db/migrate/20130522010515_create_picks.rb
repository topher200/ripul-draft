class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :team
      t.references :player
      t.string :gender
      t.boolean :automatic
      t.integer :number

      t.timestamps
    end
    add_index :picks, :team_id
    add_index :picks, :player_id
  end
end
