class AddOmniauthToGolfers < ActiveRecord::Migration[5.1]
  def change
    add_column :golfers, :provider, :string
    add_index :golfers, :provider
    add_column :golfers, :uid, :string
    add_index :golfers, :uid
  end
end
