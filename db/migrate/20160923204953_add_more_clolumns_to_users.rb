class AddMoreClolumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin, :string
    add_column :users, :github, :string
  end
end
