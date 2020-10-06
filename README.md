# UI automation

This is a project to run the UI automation through the Watir Driver and cucumber. It follows the page object model.

This project also contains the option to run the driver through Interactive Ruby(irb), so allow a developer to play with the automation in a sandbox.

# Requirements

Ruby

# Running Tests

Running tests is fairly simple. First, make sure you are in the project root directory.
 
 Next, install the Ruby gem "bundler" if you have not done so already using the gem install command:
>gem install bundler

Install the the project gem third party dependincies next using bundler:
>bundle install

One of those dependencies is cucumber. To run a test, we need to run cucumber with two things in mind:

- We need to run in the bundle context, where we loaded our third party dependencies
- We need to load Cucumber within an environment

To do both of these and run our tests, we use one command:
>bundle exec cucumber -r cucumber_env.rb

"bundle exec" runs cucumber in our bundle context, while "-r cucumber_env.rb" requires/loads the dependencies within our project. Internal dependencies include things like the feature files themselves, step definitions, as well as, again, our third party dependencies(bundle sets up our dependencies within Ruby, we still need to pull them into our project by loading them in our environment).

To run against a specific browser, use the "BROWSER" environment variable:

>bundle exec cucumber -r cucumber_env.rb BROWSER="firefox"

This command without a BROWSER environment variable will defualt to chrome.

Availble BROWSERs are "chrome". "firefox", "safari", "mobile", "mobile-tablet".

#Running a subset of tests

To run a subset of tests, we will need to setup test profiles within the cucumber.yml file.

There, we can setup up profiles that contain all of our cucumber parameters(run the command cucumber --help to see available paramters).

For example, if we want to run tests with certain parameters, instead of sending those everytime we run a command, we store them under a profile in the cucumber.yml:
>sample_profile: -r support/cucumber_env.rb -t '@regression' 

Now, to run tests that require our env file AND only run tests with the tag "@regression", we simply need to use the command:
>bundle exec cucumber -p sample_profile

# Starting the IRB Sandbox
To start the irb sandbox, we will need to do three things once we cd into the project directory:
 
 1. Once in the project directory, install the gem bundler if you have not done so already:
 
    >gem install bundler
 
 
 2. Next, we need to run 
    >bundle install
    
    This will install the gems we have in our Gemfile.  This gems are code libraries that our project needs to actually run. Make sure in the Gemfile you have the gem "rake"
    
    
 3. Once we have installed our gems we can start the sandbox.  To do this for a ruby mac setup, all we need to do is run:
    >bundle exec rake
    
    For Jruby setup, try the following command:
    
    >jruby -S irb -r \**insert path to irb_env.rb*\*
    
    
    
   This will run the "browser:start" rake task(we do not need to specify the rake name because it is the default for this project).
    
   The rake task will load all everything in the support/irb_env and support/common_env files.
    
   Think of them as the "environments" you're loading the sandbox in. The environments act as the context of your project, and specify what modules/classes/methods you have access to.
    
   common_env is shared by the irb_env and the cucumber_env.
    
   Once in the irb, see support/irb_env.rb for available methods.
  
  #Parallel Testing:
  To run tests in parallel:
  
  >bundle exec parallel_cucumber features/ -n 5 -o '-t @regression -r support/cucumber_env.rb -r features'
    
 For reporting, you have to be a little creative aggregating reports. Jenkins has a useful plugin to gather and combine cucumber reports in json, but it is still up to you to make sure parallel reports aren't overwritten by each other.
 
 Here is an example of reports that won't overwrite each other for your cucumber.yml
 
 >--format json --out=reports/REPORT_<%= Random.new_seed%>_<%= Time.now.strftime('%Y_%m_%d_%H_%M')%>.json

The name is a mess, but it doesn't matter in this case.
    
 
# Understanding a page object: methods
 
 # Watir
 
 https://www.rubydoc.info/gems/watir-webdriver/Watir
 
 
 
 
 
 
 
 
