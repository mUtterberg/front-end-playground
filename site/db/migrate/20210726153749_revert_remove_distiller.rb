# REMOVE ME?

class RevertRemoveDistiller < ActiveRecord::Migration[6.1]
  def change
    change_table :whiskeys do |t|
      t.string :distiller
    end

    remove_reference :whiskeys, :distillery, foreign_key: true
  end
end
