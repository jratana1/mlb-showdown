class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :mlb_id

      t.timestamps
    end
  end
end
