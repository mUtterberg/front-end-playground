class CreateProducers < ActiveRecord::Migration[6.1]
  def change
    create_table :producers do |t|
      t.string :name

      t.timestamps
    end

    change_table :distilleries do |t|
      t.references :producer, foreign_key: true
    end
  end
end
