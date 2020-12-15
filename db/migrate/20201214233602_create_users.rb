class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :instrument
      t.string :bio
      t.boolean :contractor, default: false
      t.string :password_digest
      t.integer :union_id
   

      t.timestamps
    end
  end
end
