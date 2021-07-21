class CreateCommentData < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_data do |t|
      t.string :datum_type
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
