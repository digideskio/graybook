Graybook

== Description:
  
Pulls contact lists from EVERYWHERE! (Some sites not included.)

== Features:
  
The current list of supported services and file types:

import:
- AOL
- CSV files
- Gmail
- Hotmail
- Yahoo! Mail

export:
- Simple hash (default)
- JSON (soon)

If you create an additional importer or exporter - or simply find a bug - please consider submitting it as a patch to the project so the community can all benefit from your hard work and ingenuity. 

== Synopsis:

# An example of fetching Gmail contacts - by default, returns an array of hashes with :name and :email
  contacts = Graybook.get :username => 'me@gmail.com', :password => 'whatever'

== Requirements:

* Mechanize and its dependencies, for interacting with online providers
* Fastercsv for reading CSV, Mechanize >= 0.7.0 for page scraping

== Install:

1. gem install gemcutter
1. gem tumble
2. gem install graybook

== Thanks:

Big thanks to Contentfree for making Blackbook.

== License:

Copyright (c) 2009, kojul.com
Copyright (c) 2007, Contentfree

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
