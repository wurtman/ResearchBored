# README


## Prerequisites

```
$> ruby -v  
ruby 3.1.0p0 // you need at least version 3 here  

$> bundle -v  
Bundler version 2.2.11  

$> npm -v  
8.3.0 // you need at least version 7.1 here  

$> yarn -v  
1.22.10

$> psql --version  
psql (PostgreSQL) 13.1 // let's use a production-ready database locally  

$> foreman -v
0.87.2

$> redis-cli ping
PONG

$> redis-server -v
6.0.5 // you will need at least version 4 here
```

Any upper version should work


## Install files

Unzip and copy/paste the "bootrails" directory on you computer.

Now you should have the bootrails app, for example, under `~/workspace/bootrails`


## Initialize git

```
$/bootrails> git init
```


## (Optional) Rename the application

Maybe you want a more custom name for you app.

By default, the app is called "bootrails".

If you want to rename it, please read https://www.bootrails.com/blog/how-to-rename-a-rails-app/


## How to install the application locally

```
$/bootrails> yarn
$/bootrails> bundle install 
$/bootrails> bin/rails db:create db:migrate db:seed
```


## How to develop features locally

```
$/bootrails> foreman start -f Procfile.dev
```

This will start vite server (for the frontend assets) and local Rails server.


## How to login to the app

By default, there are 2 users inside your app :

 - An admin, with login "admin@example.com" and password "Mysecret+1234"
 - A customer, with login "customer@example.com" and password "Mysecret+1234"

Once in production, don't forget to create a real admin user, and delete the 2 default ones.


## Discover user features of Bootrails

You can launch the e2e test suite, with the visual editor. 

```
bin/rails cypress:open
```

Once launched, click on "Run all tests" on the top-right corner.
This will give you a good overview of Bootrails features, in a user point of view.

## How to launch tests locally, with coverage

JavaScript
```
yarn test
```

Ruby (unit tests) and Cypress (e2e tests)
```
bin/rails db:drop db:create db:migrate RAILS_ENV=test
rm -rf coverage
FUNCTIONAL_COVERAGE_PLEASE=true bin/rails cypress:run 
UNIT_COVERAGE_PLEASE=true bin/rails test
bin/rails coverage:report
```

The last line will merge unit & e2e reports.
All coverage reports are then available in the coverage/ folder


## How to launch tests locally, without coverage

JavaScript - no difference, just launch `yarn test`, coverage is still set up, but will not slow down the test suite.

Rails unit tests
```
bin/rails test
```

e2e test, with visual editor
```
bin/rails cypress:open
```

e2e test, headless run, without editor (like on the CI)
```
bin/rails cypress:run
```


## How to deploy to Heroku

First installation

```
heroku login  
heroku create  
bundle lock --add-platform x86_64-linux  
heroku addons:create heroku-postgresql:hobby-dev  
heroku addons:create heroku-redis:hobby-dev  
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
heroku config:set NPM_CONFIG_PRODUCTION=false YARN_PRODUCTION=false
heroku config:set APP_EMAIL_FROM=from@example.com # insert your own value here
heroku config:set APP_EMAIL_HELP=support@example.com # insert your own value here
git add . && git commit -m 'ready for prod'  
git push heroku main  
heroku ps:scale worker=1
heroku run rails db:seed

```

After this first installation, all you have to do once you want to deliver a new feature is :

```
git add . && git commit -m 'my new feature'  
git push heroku main  
```


## Link the application to CircleCI

Look for CircleCI integration in your version control system (GitHub, or GitLab, or equivalent).

The application is already prepared for CircleCI, the configuration is under `.circleci/config.yml`

Once the (hopefully green!) build is over, check the "artifacts" tab, and open the file that ends with "coverage/index.html".


## Customize your application

### Environment variable

Create a .env file at the root of your application, locally.
Add a line as follow :

```
APP_EMAIL_FROM=from@example.com
APP_EMAIL_HELP=support@example.com
```

The value `from@example.com` will not work of course, however it could be enough in development or test mode, where emails are actually not sent by default.

On Heroku, environment variables can be added/viewed under the "settings" tab of the dashboard. Click "reveal config vars". 
And add the APP_EMAIL_FROM with a real email address (see below).

### External Email provider is required

Why ? The user needs to verify the account or reset password. 
These actions are possible only if there is a professional email provider configured.

You **must** configure your application with a professional email provider like MailChimp or PostMark.

Bootrails is not bound to any of them so feel free to pick the one you prefer. (MailChimp, MailGun, PostMark, etc.)

Then add relevant configuration in `config/environments/production.rb` (development and test do not need to be changed, so preferably to not change `application.rb`)

### Meta data

Change config/meta.yml data according to your needs

### Open customer portal

Connect as customer (customer@example.com / Mysecret+1234), and go to the /profile/billing page.
"Open customer portal" is not bound to any portal. Add a relevant link here.

### Customer settings

All customer preferences under /profile/preference are here as example, are also saved in database.
But are not mapped to any actual newsletter or course. Build your own customer preferences, and map them to something relevant to your own businness.

### Admin KPI

The KPIs on the admin default page (/admin) are hard-coded, feel free to change them according to your needs.

### Landing page

CSS can be changed under `app/frontend/scss/landing.scss`
Text and image can be changed under `app/views/home/*.html.erb`

### Other pages

Other public pages (about, credits, etc) are accessible from `app/views/home`. 
They have some default content you will have to modify, of course.

### Editables

Some parts of the HTML may be modified by an administrator. 
By default, the big quote on the landing page, and the "terms and condition" page can me modified from the admin.
To see how the HTML is injected, see `app/views/page/terms.html.erb`, and `app/controllers/page_controller.rb`.
Feel free to add or remove "editables" parts wherever you want.


## First steps

### Create a real administrator for the app

Once launced, don't forget to create one or more real administrator of the website.

By default, there are 2 users inside your app :

 - An admin, with login "admin@example.com" and password "Mysecret+1234"
 - A customer, with login "customer@example.com" and password "Mysecret+1234"

Create a new administrator, with a real e-mail, and delete the 2 default users, for security purposes.

### Search for help

You should now enjoy a fully working Ruby-on-Rails application. 

If anything is not working, try to reach us by email, or use the GitHub repository dedicated to the discussions and issues : https://github.com/bdavidxyz/bootrails_place


## Extend the customer /profile pages

Don't rely on Rails scaffolders. We have tried to modify them, in order to match Bootrails views and controllers, but it quickly appeared to be very inefficient. Too much small differences between screens made impossible to generalise this approach.

Instead, find the screen that is close to your need, and copy/paste/modify views and controllers accordingly.

Note that `app/views/shared/_profile_secondary_nav.html.erb` contains the navigation between profile items.


## Extend the /admin pages

Again, don't rely on Rails scaffolders, and copy/paste existing views and controllers according to your needs.

Note that `app/views/shared/_admin_nav.html.erb` contains the navigation between admin items.



## List of gems used

### In order to send emails

No gem are used here, because it's already inside Rails by default.

However, it is important to take time to understand how Action Mailer work, because emailing is an important part of many Rails application. 

Authentication alone requires email to work properly.

If you are not comfortable with Action Mailer, here is an article we wrote, it's also how we installed Action Mailer :

https://www.bootrails.com/blog/action-mailer-tutorial/


### Old assets (CSS, JS...) pipeline

```
gem "sprockets-rails"
```

This is the old assets pipeline for Rails. It is not used, but keeped for backward compability reasons.


### Relational database

```
gem "pg", "~> 1.1"
```

Postgre is the most used production-ready, relational database in the Ruby-on-Rails world, so we just kept in simple here.


### The web server

```
gem "puma", "~> 5.0"
```

Puma is the default web server for Rails.


### Windows compatibility

```
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
```

We don't know much about this default gem, but without it, Rails doesn't work on the Windows platform.


### Modern frontend assets management

```
gem 'vite_rails'
```

ViteJS is a complete for the Ruby-on-Rails frontend assets management. The frontend assets management is very unstable since Rails 5.1, so our idea is to use something already stable in the industry, and just keep Sprockets as backward compatibility.

In order to understand how we build it, here is an article on the blog : https://www.bootrails.com/blog/vitejs-rails-a-wonderful-combination/


### Authentication

```
gem "rodauth-rails", "~> 1.0"
```

Rodauth is an elegant authentication gem for Rails. Yes, we are aware of Devise, Clearance, Sorcery, etc. But Rodauth is far better for at least two reasons :

 - very minimalistic installation
 - Ruby based, so not invasive inside the Rails layers
 - very easy to extend if needed
 - excellent supports from the creators


Here is how we installed it : https://www.bootrails.com/blog/rails-authentication-with-rodauth-an-elegant-gem/


### Stubbing email locally

```
gem 'letter_opener', group: :development
```

Letter Opener allows the developer to view any sent email in the browser (e-mail are not actually sent), automagically.


### Background jobs

```
gem "sidekiq"
```

Background jobs are almost mandatory in a Rails app, just for authentication, you need email confirmation, password recovery, etc, that are all handle _via_ emailing.

And it is strongly advised to deliver emails with the `.deliver_later` method. That can only be properly handled, in production, by a specific job runner like Sidekiq or DelayedJobs.

Here is how we installed it : https://www.bootrails.com/blog/rails-sidekiq-tutorial/


### In-memory, key-value database

```
gem "redis"
```

Redis is a key-value database. It has numerous use-cases in a Rails app. So far it is only needed by Sidekiq, but in a near future, Redis will serve other features.


### Beautiful debugging

```
gem "awesome_print"
```

Awesome print allows better debugging. Write `ap @my_variable` anywhere, and once reached, it will be beautifully printed in the console.


### Monitoring Rails DB

```
gem "rails_db", ">= 2.3.1"
```

It can be very handy to debug the app directly in the browser.


### Read environment variables locally

```
gem 'dotenv-rails', groups: [:development, :test]
```

Environment variables are variables that should not be hardcoded in the repository, because they may change at any moment. Think about secret passwords or URL. 

This gem allows the developer to use them in development and test mode.

```shell
# inside .env, at the root of the Rails project
MY_KEY=MY_VALUE
MY_EMAIL=foo@bar.com
````

You write them inside a ".env" file, and you can then access them via ENV['MY_KEY']


### Read Markdown

```
gem 'redcarpet'
```

Rails is unable to read Markdown, unless you use an appropriate gem. Once the is loaded, you can access it _via_ `Redcarpet::Markdown`


### System testing

```
gem 'cypress-rails', groups: [:development, :test]
```

System testing is possible by default with Rails, but very tedious to install and unstable once launched.

Instead, Cypress is a well-known standard of the industry. Mature, stable, and very easy to use.

Here is the article we wrote about it : https://www.bootrails.com/blog/rails-cypress-testing/


### Stubbing external requests while testing

```
gem 'webmock', groups: [:test]
```

We feel Webmock mandatory for one reason : avoid the test suite to reach any real URL.

You could be banned from real website, and you could slow down your test suite easily.

One line ensure that no real URL will ever be reached : 

```
WebMock.disable_net_connect!(allow_localhost: true)
```

Code excerpt should be pretty clear :)


### Test coverage

```
gem 'simplecov', require: false, group: :test
```

Simplecov will only cover Ruby lines (no JavaScript). JavaScript coverage is ensured by Jest + Istanbul.


### Authorization

```
gem "action_policy"
```

Customers are not allowed to access the admin dashboard for example. Visitors are not allowed to access their profile. `action_policy` is an advanced version of the well-known `pundit` gem.

### Allow Gzip

```
gem 'heroku-deflater', :group => :production
```

Gzip will compress JS and CSS files. On heroku, this is possible thanks to the 'heroku-deflater' gem, however, if you don't use Heroku, you can simply remove this gem from the Gemfile.

