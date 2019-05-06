class AddNicknameToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :nickname, :string
  end
end
