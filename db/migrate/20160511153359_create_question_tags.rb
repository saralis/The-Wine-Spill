class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :question_id, :tag_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
