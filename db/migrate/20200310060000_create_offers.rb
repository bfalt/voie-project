class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :status, default: 'pending'
      t.integer :price
      t.boolean :completed, default: false
      t.references :job_listing, foreign_key: true
      t.references :agent, foreign_key: true

      t.timestamps
    end
  end
end
