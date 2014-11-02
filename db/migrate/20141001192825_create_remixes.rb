class CreateRemixes < ActiveRecord::Migration
  def change
  	create_table :remixes do |t|
  		t.string 			:name
  		t.string 			:download_url
  		t.references 	:circle
  		t.references 	:stem
  		t.references 	:remixer

  		t.timestamps
  	end
  end
end
