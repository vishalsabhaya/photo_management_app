# Photo Management Application(写真管理アプリケーション)

ユーザーごとに写真をアップロードし、写真一覧を表示します。 OAuth統合を使用して写真をサーバーにツイートします。

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