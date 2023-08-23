class CreateBulletinBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :bulletin_boards do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
