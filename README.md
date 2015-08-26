.emacs.d
========

Emacs configuration

About
-----

How to use these files
----------------------
If you don't already have Emacs install it. I'm using Emacs 24.4
Clone (or download and extract) this repository into your your home directory (Mac "~/" Windows "%HOME%").
Once you have a "~/.emacs.d" directory edit your "~/.emacs" file to require emacs-config by adding these two lines:

<pre>
(add-to-list 'load-path "~/.emacs.d")
(require 'my-config)
</pre>
