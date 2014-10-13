class CreateEnts < ActiveRecord::Migration
  def change
    create_table :ents do |t|
      t.text :title
      t.text :desc
      t.string :link
      t.string :author
      t.string :pub
      t.string :md5

      t.timestamps
    end
  end
end
