class CreatePersonalDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_details do |t|
      t.string :about_me
      t.string :location
      t.string :phone_number

      t.timestamps
    end
  end
end
