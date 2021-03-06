DuckWatcher
=======================

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

DuckWatcher watches loud ducks in Twitter
and reports to [AsakusaSatellite](http://www.codefirst.org/AsakusaSatellite/).

Authors
-----------------------

 * @mallowlabs

Requirements
-----------------------
 * Ruby 1.8+
 * Bundler 1.0.15+

Installation
-----------------------

Type below command:

    $ bundle install --path vendor/bundle
    $ cp .env.example .env
    $ vi .env
    $ bundle exec ruby lib/oauth_helper.rb
    $ vi .env
    $ bundle exec foreman start

Installation to Heroku
-----------------------

Type below command:

    $ heroku create xxxxx
    $ git push heroku master
    $ heroku scale bot=1
    $ heroku config:add KEYWORDS=... ASAKUSA_SATELLITE_...

set KEYWORDS like "codefirst,asakusasatellite,..."

License
-----------------------

The MIT License (MIT) Copyright (c) 2012 codefirst.org

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

