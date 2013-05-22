class AddRipulIdNumberToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :ripul_id_number, :integer
  end
end
