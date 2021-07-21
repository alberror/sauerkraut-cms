class CreatePostData < ActiveRecord::Migration[6.1]
  def change
    create_table :post_data do |t|
      t.string :datum_type
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
