class AddUserReferencesToFlat < ActiveRecord::Migration[7.1]
  def change
    add_reference :flats, :user, foreign_key: true
  end
end
