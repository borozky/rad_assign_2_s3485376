# RAD Assignment 2

<b>Joshua Orozco - s3485376@student.rmit.edu.au</b> <br>
- working alone, no bonus marks :( 

**Additional gems added**
gem "fog-aws"

**Last deployment log**
[safe-earth-62623.herokuapp.com](https://safe-earth-62623.herokuapp.com)

    Counting objects: 20, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (20/20), done.
    Writing objects: 100% (20/20), 5.61 KiB | 0 bytes/s, done.
    Total 20 (delta 14), reused 0 (delta 0)
    remote: Compressing source files... done.
    remote: Building source:
    remote: 
    remote: -----> Ruby app detected
    remote: -----> Compiling Ruby/Rails
    remote: -----> Using Ruby version: ruby-2.3.4
    remote: ###### WARNING:
    remote:        Removing `Gemfile.lock` because it was generated on Windows.
    remote:        Bundler will do a full resolve so native gems are handled properly.
    remote:        This may result in unexpected gem versions being used in your app.
    remote:        In rare occasions Bundler may not be able to resolve your dependencies at all.
    remote:        https://devcenter.heroku.com/articles/bundler-windows-gemfile
    remote: 
    remote: -----> Installing dependencies using bundler 1.13.7
    remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4
    remote:        Fetching gem metadata from https://rubygems.org/.........
    remote:        Fetching version metadata from https://rubygems.org/..
    remote:        Fetching dependency metadata from https://rubygems.org/.
    remote:        Resolving dependencies...
    remote:        Using rake 12.0.0
    remote:        Using concurrent-ruby 1.0.5
    remote:        Using i18n 0.8.1
    remote:        Using minitest 5.10.2
    remote:        Using thread_safe 0.3.6
    remote:        Using builder 3.2.3
    remote:        Using erubis 2.7.0
    remote:        Using mini_portile2 2.1.0
    remote:        Using rack 2.0.3
    remote:        Using nio4r 1.2.1
    remote:        Using websocket-extensions 0.1.2
    remote:        Using mime-types-data 3.2016.0521
    remote:        Using arel 7.1.4
    remote:        Using execjs 2.7.0
    remote:        Using bcrypt 3.1.11
    remote:        Using sass 3.4.24
    remote:        Using bundler 1.13.7
    remote:        Using coffee-script-source 1.12.2
    remote:        Using method_source 0.8.2
    remote:        Using thor 0.19.4
    remote:        Using excon 0.55.0
    remote:        Using formatador 0.2.5
    remote:        Using multi_json 1.12.1
    remote:        Using ipaddress 0.8.3
    remote:        Using mini_magick 4.7.0
    remote:        Using pg 0.18.4
    remote:        Using puma 3.4.0
    remote:        Using tilt 2.0.7
    remote:        Using turbolinks-source 5.0.3
    remote:        Using tzinfo 1.2.3
    remote:        Using nokogiri 1.7.2
    remote:        Using rack-test 0.6.3
    remote:        Using sprockets 3.7.1
    remote:        Using mime-types 3.1
    remote:        Using autoprefixer-rails 7.1.1
    remote:        Using uglifier 3.0.0
    remote:        Using websocket-driver 0.6.5
    remote:        Using coffee-script 2.4.1
    remote:        Using fog-core 1.44.2
    remote:        Using activesupport 5.0.1
    remote:        Using loofah 2.0.3
    remote:        Using turbolinks 5.0.1
    remote:        Using mail 2.6.5
    remote:        Using bootstrap-sass 3.3.6
    remote:        Using fog-json 1.0.2
    remote:        Using fog-xml 0.1.3
    remote:        Using rails-dom-testing 2.0.3
    remote:        Using globalid 0.4.0
    remote:        Using activemodel 5.0.1
    remote:        Using jbuilder 2.4.1
    remote:        Using fog-aws 1.3.0
    remote:        Using activejob 5.0.1
    remote:        Using activerecord 5.0.1
    remote:        Using carrierwave 1.1.0
    remote:        Using rails-html-sanitizer 1.0.3
    remote:        Using actionview 5.0.1
    remote:        Using actionpack 5.0.1
    remote:        Using actioncable 5.0.1
    remote:        Using actionmailer 5.0.1
    remote:        Using railties 5.0.1
    remote:        Using sprockets-rails 3.2.0
    remote:        Using coffee-rails 4.2.1
    remote:        Using font-awesome-rails 4.7.0.2
    remote:        Using jquery-rails 4.1.1
    remote:        Using rails 5.0.1
    remote:        Using sass-rails 5.0.6
    remote:        Bundle complete! 26 Gemfile dependencies, 66 gems now installed.
    remote:        Gems in the groups development and test were not installed.
    remote:        Bundled gems are installed into ./vendor/bundle.
    remote:        Bundle completed (3.45s)
    remote:        Cleaning up the bundler cache.
    remote: -----> Installing node-v6.10.0-linux-x64
    remote:        Detected manifest file, assuming assets were compiled locally
    remote: 
    remote: ###### WARNING:
    remote:        You have not declared a Ruby version in your Gemfile.
    remote:        To set your Ruby version add this line to your Gemfile:
    remote:        ruby '2.3.4'
    remote:        # See https://devcenter.heroku.com/articles/ruby-versions for more information.
    remote: 
    remote: ###### WARNING:
    remote:        Removing `Gemfile.lock` because it was generated on Windows.
    remote:        Bundler will do a full resolve so native gems are handled properly.
    remote:        This may result in unexpected gem versions being used in your app.
    remote:        In rare occasions Bundler may not be able to resolve your dependencies at all.
    remote:        https://devcenter.heroku.com/articles/bundler-windows-gemfile
    remote: 
    remote: ###### WARNING:
    remote:        No Procfile detected, using the default web server.
    remote:        We recommend explicitly declaring how to boot your server process via a Procfile.
    remote:        https://devcenter.heroku.com/articles/ruby-default-web-server
    remote: 
    remote: -----> Discovering process types
    remote:        Procfile declares types     -> (none)
    remote:        Default types for buildpack -> console, rake, web, worker
    remote: 
    remote: -----> Compressing...
    remote:        Done: 42.5M
    remote: -----> Launching...
    remote:        Released v19
    remote:        https://safe-earth-62623.herokuapp.com/ deployed to Heroku
    remote: 
    remote: Verifying deploy... done.
    To https://git.heroku.com/safe-earth-62623.git
       8b346bc..6410b61  master -> master