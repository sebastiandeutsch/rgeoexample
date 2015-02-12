class CreateCarParks < ActiveRecord::Migration
  def change
    create_table :car_parks do |t|
      t.string :name
      t.string :street
      t.string :zip
      t.string :city
      t.st_point :lonlat, geographic: true

      t.timestamps null: false
    end
  end
end
