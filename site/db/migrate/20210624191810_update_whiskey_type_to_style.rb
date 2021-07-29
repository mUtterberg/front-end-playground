class UpdateWhiskeyTypeToStyle < ActiveRecord::Migration[6.1]
  def change
    change_table :whiskeys do |t|
      t.rename :type, :style
      t.integer :proof
      t.float :rating
      t.string :distiller
    end
  end
end
