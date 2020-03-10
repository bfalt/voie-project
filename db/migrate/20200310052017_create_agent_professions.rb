class CreateAgentProfessions < ActiveRecord::Migration[5.2]
  def change
    create_table :agent_professions do |t|
      t.references :agent, foreign_key: true
      t.references :profession, foreign_key: true

      t.timestamps
    end
  end
end
