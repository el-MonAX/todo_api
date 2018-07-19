class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, default: false
      t.integer :position
      t.datetime :deadline
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
