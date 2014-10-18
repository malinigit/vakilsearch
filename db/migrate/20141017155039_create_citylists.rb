class CreateCitylists < ActiveRecord::Migration
  def change
    create_table :citylists do |t|
      t.string :code
      t.string :name
      t.integer :exp
      t.string :location
      t.decimal :rating

      t.timestamps
    end
  end
end
