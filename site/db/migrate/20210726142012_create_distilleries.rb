class CreateDistilleries < ActiveRecord::Migration[6.1]
  def change

    create_table :distilleries do |t|
      t.string :name

      t.string :country, null: false
      t.string :state
      t.string :city
      t.float :longitude
      t.float :latitude

      t.timestamps
    end

    change_table :whiskeys do |t|
      t.remove :distiller, :string
      t.references :distillery, foreign_key: true
    end
  end
end
