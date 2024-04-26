# README

## Installation and run Ruby on Rails app
```
git clone git@github.com:doston9471/appointment-booking.git
cd appointment-booking
bundle install
yarn install  # to install @rails/request.js

# if necessary
# ./bin/importmap pin @rails/request.js  

rails db:create
rails db:migrate

rake import:coaches # to import coaches from CSV file

rails s
```

### TODO
#### Ruby on Rails
- [x] Create Rails project
- [x] Create necessary models
- [x] Add reserve time slot feature
- [x] Add some hotwire stuff to get available slots for selected day
- [ ] TODOs

