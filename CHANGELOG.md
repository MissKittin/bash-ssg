# [1.1]

### Fixed

- Added missing `unset 'posts__post_id'` and fixed busybox `posts_rss__post_pubdate` in posts `meta.rc`
- Fixed wrong date in `feed.xsl`
- Fixed a bug with the menu bar overlapping the footer (`css`) in `template-default-nojs`
- Fixed HTML comment removal in `minify` module
- Fixed `include.rc` handling in user modules in `import-includes.rc`

### Changed

- Added `database/command-stack` support, improved tool checking and added support for `generator-init.rc` library in `generate`
- Added `defer` for template `js` in `template-default`
- Added the ability to change the template name (to e.g. `template-default-new`) in all templates
- Added plugin disabler for posts (`posts__post_plugins` variable handled by `generate_post_box`) in `posts` module
- Moved functions to a separate file, added minification of `.htm` files in the `minify` module
- Moved main function to a separate file, added `gzip__process_files` option in the `gzip` module
- Added option to change `cp` arguments in `static` module
- Added template settings
- Added `pre-module` and `post-module` hooks in `generate`

### Removed

- `template-simpleblog` moved to a separate repository
