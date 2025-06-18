class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :technologies
      t.string :github_url
      t.string :demo_url

      t.timestamps
    end
  end
end
