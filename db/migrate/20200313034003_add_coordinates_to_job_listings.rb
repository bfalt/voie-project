class AddCoordinatesToJobListings < ActiveRecord::Migration[5.2]
  def change
    add_column :job_listings, :latitude, :float
    add_column :job_listings, :longitude, :float
  end
end
