# REMOVE ME?

class AddDistilleryToWhiskeys < ActiveRecord::Migration[6.1]
  def change
    change_table :whiskeys do |t|
      t.remove :distiller, :string
      t.references :distillery, foreign_key: true
    end
  end
end
