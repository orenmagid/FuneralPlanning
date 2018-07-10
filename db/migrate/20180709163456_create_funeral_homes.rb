class CreateFuneralHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :funeral_homes do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
