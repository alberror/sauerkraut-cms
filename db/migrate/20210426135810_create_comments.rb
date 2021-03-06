class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.string :author
      t.string :status, default: "unconfirmed"
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
