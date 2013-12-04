require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'fileutils'
require './config/environments'
require './company'

# Get a list of all companies
get '/companies', :provides	=> :json do
	content_type :json

	companies = Company.all
	if companies
		companies.to_json
	else
		status 400
	end
end

# Get details about a company
get '/company/:id', :provides => :json do
	content_type :json

	#company = Company.where(company_id: params[:id]).first
	company = Company.where(id: params[:id]).first
	if company
		company.to_json
	else
		{:status => "Not found"}.to_json
	end
end

# Create a new company
post '/company', :provides	=> :json do
	content_type :json

	company_params = accept_params(params, :company_id, :name, :address, :city, :country, :email, :phone_number, :owner)
	check_file_exist_and_save = false

	if company_params[:owner]
		owner_file_info = company_params[:owner]
		company_params[:owner] = ""

		if owner_file_info.is_a?(Hash)
			tempfile = owner_file_info[:tempfile]
    		original_filename = owner_file_info[:filename] 
    		file_extension = File.extname(original_filename);
    		filename_md5 = "#{Digest::MD5.hexdigest(original_filename)}"
    		filename = "#{filename_md5}" + "#{file_extension}"
    	end

    	if tempfile && filename
			FileUtils.cp(tempfile.path, "uploads/#{filename}")
			company_params[:owner] = "uploads/#{filename}"
			check_file_exist_and_save = true
		end
	end
	
	if check_file_exist_and_save
		company = Company.new(company_params)
		
		if company.valid?
			company.save
			{:status => '201'}.to_json
		else
			{:status => '400'}.to_json
		end
	else
		{:error => 'Uploading file not found'}.to_json
	end
	
end


# Update a company
put '/company/:id', :provides => :json do
	content_type :json

	company_params = accept_params(params, :company_id, :name, :address, :city, :country, :email, :phone_number, :owner)
	check_file_exist_and_save = false

	#company =  Company.find(params[:id])
	company = Company.where(id: params[:id]).first

	if company
		if company_params[:owner]
			owner_file_info = company_params[:owner]
			company_params[:owner] = ""

			if owner_file_info.is_a?(Hash)
				tempfile = owner_file_info[:tempfile]
	    		original_filename = owner_file_info[:filename] 
	    		file_extension = File.extname(original_filename);
	    		filename_md5 = "#{Digest::MD5.hexdigest(original_filename)}"
	    		filename = "#{filename_md5}" + "#{file_extension}"
	    	end

	    	if tempfile && filename
				FileUtils.cp(tempfile.path, "uploads/#{filename}")
				company_params[:owner] = "uploads/#{filename}"
				FileUtils.rm(company.owner)
				check_file_exist_and_save = true
			end
		end
		
		if check_file_exist_and_save
			company.update(company_params)
			if company.valid?
				company.save
				{:status => '201'}.to_json
			else
				{:status => '400'}.to_json
			end
		else
			{:error => 'Uploading file not found'}.to_json
		end
	else
		{:status => "No id found to update"}
	end
end

# Delete a company
delete '/company/:id', :provides => :json do
	content_type :json

	#company = Company.where(company_id: params[:id]).first
	#company = Company.find(params[:id])
	company = Company.where(id: params[:id]).first

	if company
		{:success => "deleted"}.to_json if company.destroy
	else
		{:status => "Not found"}.to_json
	end
end


private

 def accept_params(params, *fields)
  new_params = { }
  fields.each do |name|
    new_params[name] = params[name] if params[name]
  end
  new_params
end