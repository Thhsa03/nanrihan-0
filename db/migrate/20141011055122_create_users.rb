class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.string :name
  		t.date :start_date
  		t.date :end_date
  		t.string :location
      t.float :latitude
      t.float :longitude
  		t.string :latlng
  		t.string :comment
      t.datetime :registration_date
  		t.timestamps
  	end
  end
end
