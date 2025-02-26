class Movies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :slug
      t.string :link
      t.string :beschreibung
      t.text :inhalt
      t.string :url

      t.timestamps
    end
  end
end
