class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.string :en_name
      t.string :old_name
      t.string :gender
      t.string :country
      t.date :dob
      t.string :constellation
      t.string :career
      t.string :height
      t.string :rate
      t.string :blood
      t.string :home_town
      t.string :school
      t.string :company
      t.string :weight
      t.string :religon
      t.text :hobby
      t.text :desc
      t.text :desc_short
      t.text :achievement
      t.text :event
      t.string :source
      t.string :avatar

      t.timestamps
    end
  end
end
