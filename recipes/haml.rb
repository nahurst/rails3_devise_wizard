# Application template recipe for the rails3_devise_wizard. Check for a newer version here:
# https://github.com/fortuity/rails3_devise_wizard/blob/master/recipes/haml.rb

if config['haml']
  gem 'haml', '>= 3.1.1'
  gem 'haml-rails', '>= 0.3.4', :group => :development
else
  recipes.delete('haml')
end

__END__

name: HAML
description: "Utilize Haml instead of ERB."
author: fortuity

category: templating
exclusive: templating

config:
  - haml:
      type: boolean
      prompt: Would you like to use Haml instead of ERB?