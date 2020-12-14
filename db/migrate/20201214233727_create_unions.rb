class CreateUnions < ActiveRecord::Migration[6.0]
  def change
    create_table :unions do |t|

      t.timestamps
    end
  end
end
