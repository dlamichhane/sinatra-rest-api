Commands for curls
==============

	- Get list of company
	- curl -i -H "Accept: application/json" localhost:4567/companies
	
	- Get company with id NOT company id
	- curl -i -H "Accept: application/json" localhost:4567/company/18
	
	- Create a new company
	- curl -i -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "name=Deepak" -F "address=Olympiakatu" -F "city=Vaasa" -F "country=ddddd" -F "email=dd@dd.com" -F "phone_number=222222222" -F "company_id=23" -F "owner=@/home/dlamichhane/Dev/1.jpg" -X POST http://localhost:4567/company
	
	- Update a new company
	- curl -i -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "name=Deepak" -F "address=Olympiakatu" -F "city=Vaasa" -F "country=ddddd" -F "email=dd@dd.com" -F "phone_number=222222222" -F "company_id=234" -F "owner=@/home/dlamichhane/Dev/3.jpg" -X PUT http://localhost:4567/company/13
	
	- Delete a company
	- curl -i -H 'Accept: application/json' -X DELETE localhost:4567/company/4


Demo
============
	- Heroku : http://sinatrarestapi.herokuapp.com/index.html