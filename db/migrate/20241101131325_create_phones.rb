class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.references :proposer, foreign_key: true
      t.string :number
      t.string :phone_type
    end
  end
end
