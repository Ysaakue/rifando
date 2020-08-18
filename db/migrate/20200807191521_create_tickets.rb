class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :number
      t.integer :status, default: 0
      t.integer :user_id
      t.integer :rafle_id

      t.timestamps
    end
    add_index :tickets, [:rafle_id, :number], unique: true
  end
end
