class CreateEventsEventTags < ActiveRecord::Migration
  def change
  	create_table :events_event_tags do |t|
  		t.integer :event_id
  		t.integer :event_tag_id
  	end
  end
end
