class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :gig_id
      t.integer :user_id

      t.timestamps
    end
  end
end
