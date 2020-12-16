class CreateGigInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :gig_instruments do |t|
      t.string :name
      t.integer :user_id
      t.integer :gig_id

      t.timestamps
    end
  end
end
