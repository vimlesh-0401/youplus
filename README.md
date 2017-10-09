# Youplus Ola Auto
 This application is build to simulate ola auto booking system.
 **Youplus Ola Auto** taking customer request and picking up any random request by the drivers.


 ### What you need
  * ruby 2.3.3
  * rails 5.1.4

  ### Additional GEMS
 ```
  gem 'angularjs-rails', '~> 1.5', '>= 1.5.6'
  gem 'angularjs-rails-resource', '~> 2.0'
  gem 'angular_rails_csrf'
  gem 'jquery-rails'
  gem 'bootstrap-sass', '~> 3.3.6'
  ```
  ### SETUP AND CONFIGURATIONS
  1. clone form command prompt
     ```
       git clone git@github.com:vimlesh-0401/youplus.git
     ```
  2. goto project directory

  3. install bundle
     ```
      bundle install
     ```
   4. Run migration
      ```
        rails db:create db:migrate
      ```
      if you already have database created then you can simply run
        ```
          rails db:migrate
        ```
   5. Now start server
      ```
        rails s
      ```

   6. Visit [http://localhost:3000](http://localhost:3000/)

   7. In homepage there are three tab: Dasboard, Customerapp and Driverapp.
      You can access respective functionality using those menues.
