# Photo Management Application(写真管理アプリケーション)

Upload a photo for each user and display a list of photos. Tweet photos to the server using OAuth integration.

## Getting Started

project Clone on your local machine for development and testing purposes.

```
https://github.com/vishalsabhaya/photo_management_app.git
```

### Prerequisites

* Ruby version

  - ruby-2.7.1

* Ruby version

  - Rails-6.1.4

* Testing framework

  - Minitest


* System dependencies

  - Node.js
  > Please download and install Node.js https://nodejs.org/en/download/

  - Bundle to install app dependency.

  ```
  bundle install
  ```

* Database config

  - database used: *sqlite3*

  - run migration to reflect database changes.

  ```
  rake db:migrate
  ```

* Create sample data for app.

  ```
  rake db:seed
  ```

* MyTweetApp setting

  - rename secrets.example.yml to secrets.yml

  - do setting in secrets.yml

* test case targeted

  - model : data validation

  - controller : routes test

#### Running Tests

Test cases written using *RSpec*

Run test cases using

  ```
  rails test
  ```

## Author

* **Vishal Sabhaya** - [GitHub profile](https://github.com/vishalsabhaya/)