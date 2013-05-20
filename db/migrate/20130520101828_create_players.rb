class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.references :team
      t.string :gender

      t.timestamps
    end
    add_index :players, :team_id
  end
end
