class CreateProject < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false, default: ''
      t.references :user_account, null: false, foreign_key: true
    end
  end
end
