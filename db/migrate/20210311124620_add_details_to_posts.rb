class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :summary, :string
    add_column :posts, :slug, :string
  end
end
