class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :gig_id
      t.boolean :submit, default: false

      t.timestamps
    end
  end
end
