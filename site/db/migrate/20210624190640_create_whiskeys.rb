class CreateWhiskeys < ActiveRecord::Migration[6.1]
  def change
    create_table :whiskeys do |t|
      t.string :brand
      t.string :name
      t.string :type
      t.float :abv

      t.timestamps
    end
  end
end
