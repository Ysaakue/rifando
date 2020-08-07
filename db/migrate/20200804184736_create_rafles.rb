class CreateRafles < ActiveRecord::Migration[6.0]
  def change
    create_table :rafles do |t|
      t.string   :name
      t.datetime :date_time
      t.string   :description
      t.integer  :numbers_quantity
      t.string   :premium
      t.integer  :winner_number
      t.string   :image_url
      t.integer  :owner_id

      t.timestamps
    end
  end
end
