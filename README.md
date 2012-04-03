JRuby Rails Sample App
======================

Usage Guide
------------

This app is intended to show the changes you need to make to a Rails app when using JRuby in order to be able to deploy it to Cloud Foundry. 

### Running locally

This application is configured to use MySQL so you would need to have this running locally. You would also need to have a working installation of JRuby.

Clone this repository and run the application locally using:

jruby -S rake db:create
jruby -S rake db:migrate
jruby -S rails server


### Running on Cloud Foundry

In addition to a working installation of JRuby you would also need to have the Warbler and vmc gems installed.

Now we need to package the war using:

    jruby -S bundle install
    jruby -S rake assets:precompile
    jruby -S warble

To deploy, we need to do that from a different directory so we can configure rbenv or RVM to use C Ruby instead of JRuby which is needed by vmc

    mv bookshelf.war deploy/.
    cd deploy

Now we are ready to push the app to Cloud Foundry

    vmc target api.cloudfoundry.com
    vmc login cloud@mycompany.com
    vmc push bookshelf
