# animal_shelter_project
Ruby/Sinatra/PostgreSQL project Homeward Bound Animal Shelter(week 5 CodeClan Course): A management system to keep track of animals and owners for an animal shelter.
- CRUD web application
- RESTful routes

database name = shelter

Users are able to:
- get a list of all the animals and their date of admission
- get a list of all the prospective owners
- mark an animal as being adoptable or not ready for adoption
- assign an animal to a new owner
- get a list of all the successful adoptions

- there are separate views for adoptable animals and animals not ready for adoption
- delete animals, owners, adoptions       
- edit owner 

Things I would modify:
- When delete an adoption, update the animal adopted to false again
- Improve design of navigation for user
- Admission date as a date not a string
- Improve styling/layout, mainly of the registration and edit forms

Things I would add:
- Create delete/edit/registration confirmation messages
- Add descriptions of animals and owners
- Show animals that an owner has adopted in the owner view
- Have a search form on the animal index page to search by type of animal, adoptable status etc rather than separate links



