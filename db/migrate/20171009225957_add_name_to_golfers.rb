class AddNameToGolfers < ActiveRecord::Migration[5.1]
  def change
    add_column :golfers, :name, :string
  end
end
