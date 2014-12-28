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
PictureFrom.url('zuck')
# => http://graph.facebook.com/zuck/picture

PictureFrom.url('Mark Zuckerberg')
# => http://graph.facebook.com/zuck/picture

PictureFrom.url('@unclebobmartin')
# => https://pbs.twimg.com/profile_images/1102364992/clean_code_72_color_400x400.png

PictureFrom.url('karreiro@gmail.com')
# => http://www.gravatar.com/avatar/16be5820a296f5bce151f0c1b5e16fc8 
```

Engines
------------
PicutreFrom has many engines for finding the appropriate image for any user in your application:

  - Gravatar
    - by e-mail
  - Facebook
    - by username
    - by e-mail
    - by user information
  - Twitter
    - by username

Contributing
------------

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request
