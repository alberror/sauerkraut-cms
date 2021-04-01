class AddDetailsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :client, :string
    add_column :projects, :partner, :string
    add_column :projects, :summary, :string
    add_column :projects, :status, :string, default: "unconfirmed"
  end
end
