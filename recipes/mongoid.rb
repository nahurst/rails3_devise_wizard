# Application template recipe for the rails3_devise_wizard. Check for a newer version here:
# https://github.com/fortuity/rails3_devise_wizard/blob/master/recipes/mongoid.rb

if config['mongoid']
  say_wizard "REMINDER: When creating a Rails app using Mongoid..."
  say_wizard "you should add the '-O' flag to 'rails new'"
  gem 'bson_ext', '>= 1.3.0'
  gem 'mongoid', '>= 2.0.1'
else
  recipes.delete('mongoid')
end

if config['mongoid']
  after_bundler do
    say_wizard "Mongoid recipe running 'after bundler'"
    # note: the mongoid generator automatically modifies the config/application.rb file
    # to remove the ActiveRecord dependency by commenting out "require active_record/railtie'"
    generate 'mongoid:config'
    # remove the unnecessary 'config/database.yml' file
    remove_file 'config/database.yml'
  end
end

__END__

name: Mongoid
description: "Use Mongoid to connect to a MongoDB database."
author: fortuity

category: persistence
exclusive: orm
tags: [orm, mongodb]

args: ["-O"]

config:
  - mongoid:
      type: boolean
      prompt: Would you like to use Mongoid to connect to a MongoDB database?