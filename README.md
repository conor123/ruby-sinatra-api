About
=====

Simple Sinatra API with SQLite backend

Dependencies
============
Ruby 2.3.4 compatible
Note: Ruby 2.4.0 has a conflict with default JSON gem

Execution
=========
ruby -Ilib app.rb

Testing
=======
To run a test

ruby -Ilib tests/app_test.rb

or from Rakefile

`rake test`

Issues
======
- Test are not currently run in order so they pass/fail intermittently
- Need to set up before conditions correctly, use fixtures etc.
