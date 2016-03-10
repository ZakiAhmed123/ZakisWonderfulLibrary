class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.string :photo_id
    end
  end
end
