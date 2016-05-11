class CreateComments < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :body, null: false
      t.references :commentable, polymorphic: true, index: true
      t.references :users, null: false

      t.timestamps null: false
    end
  end
end
