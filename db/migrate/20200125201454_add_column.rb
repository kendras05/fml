class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string, uniqueness: true
  end
end
