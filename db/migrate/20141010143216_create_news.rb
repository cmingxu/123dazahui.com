class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :source
      t.text :description
      t.string :cate
      t.string :subcate
      t.string :md5
      t.string :link

      t.timestamps
    end
  end
end
