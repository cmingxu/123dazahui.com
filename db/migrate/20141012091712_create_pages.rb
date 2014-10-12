class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :title
      t.text :content
      t.text :desc
      t.string :slug
      t.date :published_at
      t.string :source

      t.timestamps
    end
  end
end
