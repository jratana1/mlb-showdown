class AddPositionToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :position, :string
    add_column :players, :firstName, :string
    add_column :players, :lastName, :string
  end
end
