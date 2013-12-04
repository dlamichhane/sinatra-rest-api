class CreateCompanies < ActiveRecord::Migration
  def up
  	create_table	:companies do |t|
  		t.integer	:company_id
  		t.string	:name
  		t.string	:address
  		t.string 	:city
  		t.string	:country
  		t.string	:email
  		t.integer	:phone_number
  		t.text		:owner
  		t.timestamps
  	end
  end

  def down
  	drop_table :companies
  end
end