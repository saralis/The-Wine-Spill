class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.references :question, :tag, null: false, index: true

      t.timestamps null: false
    end
  end
end
