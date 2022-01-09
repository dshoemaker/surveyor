# Surveyor

## Setup
You need to have Ruby 2.7.4 installed using your choice of ruby manager.

Other dependencies needed are node 14, yarn, and sqlite3:
```sh
brew install node@14
brew install yarn
brew install sqlite3
gem install rails:6.1.4.4
```

Set up the database
```sh
rails db:migrate
```

and run the app!
```sh
rails s
```

Surveyor should be available at http://localhost:3000/
