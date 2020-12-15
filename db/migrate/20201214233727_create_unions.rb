class CreateUnions < ActiveRecord::Migration[6.0]
  def change
    create_table :unions do |t|
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
