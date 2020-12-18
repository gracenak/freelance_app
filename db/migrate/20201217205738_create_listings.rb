class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :gig_id
    end
  end
end
