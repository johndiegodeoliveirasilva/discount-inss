class CreateProposers < ActiveRecord::Migration[5.2]
  def change
    create_table :proposers do |t|
      t.references :user, foreign_key: true
      t.string :full_name
      t.string :document
      t.datetime :birth_date
      t.float :income
      t.timestamps null: false
    end
  end
end
