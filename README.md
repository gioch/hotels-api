# hotels-api

Rails 5 API project. It has implemented CRUD functionality with validations, Rspec tests,
different best practices (Service objects). It stores all data about hotels in Postgres.
It is hosted on heroku (https://evening-cliffs-68697.herokuapp.com/api/hotels).
I did not added authentication to it. since it would took time. If it will be required for next tests tasks, i'll add it without problem.

To run project locally:
* download project
* run 'bundle'
* run 'rails db:create db:migrate'
* run 'rspec'

Implemented api calls

* GET accomodation_types: https://evening-cliffs-68697.herokuapp.com/api/accomodation_types
* GET suggestions: https://evening-cliffs-68697.herokuapp.com/api/suggestions?query=26
* GET all hotels: https://evening-cliffs-68697.herokuapp.com/api/hotels
* GET new hotel: https://evening-cliffs-68697.herokuapp.com/api/hotels/new
* GET show hotel: https://evening-cliffs-68697.herokuapp.com/api/hotels/6
* POST create hotel: https://evening-cliffs-68697.herokuapp.com/api/hotels
* PUT create hotel: https://evening-cliffs-68697.herokuapp.com/api/hotels/6
* DELETE delete hotel: https://evening-cliffs-68697.herokuapp.com/api/hotels/6
