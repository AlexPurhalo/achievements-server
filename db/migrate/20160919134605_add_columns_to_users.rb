class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string
    add_column :users, :age, :integer
    add_column :users, :skype, :string
    add_column :users, :mobile, :string
  end
end
