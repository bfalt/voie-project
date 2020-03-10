class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :company_name
      t.string :company_address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
