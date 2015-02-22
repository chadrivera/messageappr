class AddMembershipToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :membership_id, :integer
  end
end
