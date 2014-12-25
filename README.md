PictureFrom
============

[![Build Status](https://travis-ci.org/karreiro/picture_from.svg?branch=master)](https://travis-ci.org/karreiro/picture_from)
[![Code Climate](https://codeclimate.com/github/karreiro/picture_from/badges/gpa.svg)](https://codeclimate.com/github/karreiro/picture_from)
[![Test Coverage](https://codeclimate.com/github/karreiro/picture_from/badges/coverage.svg)](https://codeclimate.com/github/karreiro/picture_from)

PictureFrom is the most efficient library for getting profile pictures.

Installation
------------
```
gem install picture_from
```

Usage
------------

Using PictureFrom is pretty simple! First, make sure the library is required:
``` ruby
require 'picture_from'
```

Pass an user information to the library's interface:
``` ruby
PictureFrom.url('karreiro')
# => http://graph.facebook.com/karreiro/picture
```

Engines
------------
PicutreFrom has many engines for finding the appropriate image for any user in your application:

  - Gravatar
    - by e-mail ✔
    - by GitHub username
  - Facebook
    - by username ✔
    - by e-mail ✔
    - by user information ✔
  - Twitter
    - by username ✔
    - by user information
  - Linkedin
    - by username
  - Ello
    - by username

Contributing
------------

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request
