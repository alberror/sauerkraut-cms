class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :slug
      t.integer :stock
      t.string :summary
      t.text :body

      t.timestamps
    end
  end
end
