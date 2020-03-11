class AddPhoneNumberToJobListings < ActiveRecord::Migration[5.2]
  def change
    add_column :job_listings, :phone_number, :string
  end
end
