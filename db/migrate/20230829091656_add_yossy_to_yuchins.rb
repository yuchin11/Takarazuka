class AddYossyToYuchins < ActiveRecord::Migration[6.1]
  def change
    add_column :yuchins, :kumi, :string
    add_column :yuchins, :show, :string
    add_column :yuchins, :price, :integer
    add_column :yuchins, :omoi, :text
  end
end
