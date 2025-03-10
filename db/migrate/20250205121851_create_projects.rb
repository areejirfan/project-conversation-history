class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title, null:false, default: ""
      t.text :description, default: ""
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
