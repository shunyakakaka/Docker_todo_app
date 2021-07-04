class AddDetailsToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :title, :string
    add_column :boards, :body, :text
  end
end
