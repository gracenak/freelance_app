class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :title
      t.datetime :datetime
      t.string :description
      t.decimal :payment
      t.integer :user_id

      t.timestamps
    end
  end
end
