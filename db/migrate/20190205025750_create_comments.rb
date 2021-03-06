class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.references :user, foreign_key: true
      t.string :commentable_type

      t.timestamps
    end
  end
end
