Commands for curls
==============

	- Get list of company
	- curl -i -H "Accept: application/json" localhost:2222/companies
	
	- Get company with id NOT company id
	- curl -i -H "Accept: application/json" localhost:2222/company/18
	
	- Create a new company
	- curl -i -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "name=Deepak" -F "address=Olympiakatu" -F "city=Vaasa" -F "country=ddddd" -F "email=dd@dd.com" -F "phone_number=222222222" -F "company_id=23" -F "owner=@/home/dlamichhane/Dev/1.jpg" -X POST http://localhost:2222/company
	
	- Update a new company
	- curl -i -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "name=Deepak" -F "address=Olympiakatu" -F "city=Vaasa" -F "country=ddddd" -F "email=dd@dd.com" -F "phone_number=222222222" -F "company_id=234" -F "owner=@/home/dlamichhane/Dev/3.jpg" -X PUT http://localhost:2222/company/13
	
	- Delete a company
	- curl -i -H 'Accept: application/json' -X DELETE localhost:2222/company/4

