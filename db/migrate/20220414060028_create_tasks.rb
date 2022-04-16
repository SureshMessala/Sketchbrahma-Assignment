class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
end
