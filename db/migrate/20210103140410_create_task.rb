class CreateTask < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
