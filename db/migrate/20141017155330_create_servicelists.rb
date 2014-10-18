class CreateServicelists < ActiveRecord::Migration
  def change
    create_table :servicelists do |t|
      t.string :code
      t.string :servicecode
      t.string :servicename
      t.integer :charges

      t.timestamps
    end
  end
end
