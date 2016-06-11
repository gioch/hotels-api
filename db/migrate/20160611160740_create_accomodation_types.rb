class CreateAccomodationTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :accomodation_types do |t|
      t.string :name, allow_nil: false
    end
  end
end
