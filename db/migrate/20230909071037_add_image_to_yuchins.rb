class AddImageToYuchins < ActiveRecord::Migration[6.1]
  def change
    add_column :yuchins, :image, :string
  end
end
