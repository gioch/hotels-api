class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name, allow_nil: false
      t.string :address, allow_nil: false
      t.float :star_rating, default: 0
      t.references :accomodation_type, foreign_key: true
    end
  end
end
