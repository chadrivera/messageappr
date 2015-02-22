class RemoveColumnsFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :user_id, :string
    remove_column :messages, :username, :string
    remove_column :messages, :email, :string
    remove_column :messages, :phone, :string
    remove_column :messages, :city, :string
    remove_column :messages, :street, :string
    remove_column :messages, :zip, :string
    remove_column :messages, :state, :string
  end
end
