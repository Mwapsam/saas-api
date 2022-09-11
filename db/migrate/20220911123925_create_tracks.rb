class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artist
      t.string :year
      t.boolean :public, default: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
