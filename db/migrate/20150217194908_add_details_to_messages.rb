class AddDetailsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :street, :string
    add_column :messages, :city, :string
    add_column :messages, :state, :string
    add_column :messages, :email, :string
    add_column :messages, :phone, :string
    add_column :messages, :zip, :string
  end
end
