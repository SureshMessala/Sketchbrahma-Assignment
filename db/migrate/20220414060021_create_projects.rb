class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
