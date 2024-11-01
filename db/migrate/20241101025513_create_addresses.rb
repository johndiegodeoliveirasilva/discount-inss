class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :complement
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code
    end
  end
end
