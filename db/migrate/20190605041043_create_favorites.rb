class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :city
      t.references :user, foreign_key: true
    end
  end
end
