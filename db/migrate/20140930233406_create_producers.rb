class CreateProducers < ActiveRecord::Migration
  def change
  	create_table :producers do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :producer_name
  		t.string :email
  		t.string :avatar
  		t.string :location
  		t.string :password_hash

  		t.timestamps
  	end
  end
end
