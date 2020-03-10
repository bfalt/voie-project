class CreateJobListingCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :job_listing_categories do |t|
      t.references :job_listing, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
