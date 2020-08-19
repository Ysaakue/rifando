class AddPriceToRafle < ActiveRecord::Migration[6.0]
  def change
    add_column :rafles, :price, :float
  end
end
