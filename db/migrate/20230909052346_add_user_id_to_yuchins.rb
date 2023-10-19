class AddUserIdToYuchins < ActiveRecord::Migration[6.1]
  def change
    add_column :yuchins, :user_id, :integer
  end
end
