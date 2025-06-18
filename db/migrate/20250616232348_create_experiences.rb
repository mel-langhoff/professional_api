class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
