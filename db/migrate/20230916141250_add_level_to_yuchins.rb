class AddLevelToYuchins < ActiveRecord::Migration[6.1]
  def change
    add_column :yuchins, :level, :integer
  end
end
