class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :content, null:false, default: ""
      t.references :user, null:false, foreign_key:true, index:true
      t.references :project, null:false, foreign_key:true, index:true
      t.timestamps
    end
  end
end
