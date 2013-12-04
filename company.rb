require 'active_record'

class Company < ActiveRecord::Base
	validates	:company_id, presence: true, uniqueness: true
	validates	:name, presence: true
	validates	:address, presence: true
	validates	:city, presence: true
	validates	:country, presence: true
	validates	:owner, presence: true

end
