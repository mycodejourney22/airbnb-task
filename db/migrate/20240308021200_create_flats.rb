class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :address
      t.integer :price
      t.string :guest
      t.string :type

      t.timestamps
    end
  end
end
