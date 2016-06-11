class CreateAccomodationTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :accomodation_types do |t|
      t.string :name, allow_nil: false
    end

    AccomodationType.create(name: 'Hotel')
    AccomodationType.create(name: 'Motel')
    AccomodationType.create(name: 'Hostel')
    AccomodationType.create(name: 'Appartment')
  end
end
