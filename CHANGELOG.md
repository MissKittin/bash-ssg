# [1.1]

### Fixed

- Added missing `unset 'posts__post_id'` and fixed busybox `posts_rss__post_pubdate` in posts `meta.rc`
- Fixed a bug with the menu bar overlapping the footer (`css`) in `template-default-nojs`

### Changed

- Added `database/command-stack` support and improved tool checking in `generate`
- Added `defer` for template `js` in `template-default`
- Added the ability to change the template name (to e.g. `template-default-new`) in all templates
- Added plugin disabler for posts (`posts__post_plugins` variable handled by `generate_post_box`) in `posts` module
- Moved functions to a separate file, added minification of `.htm` files in the `minify` module
- Moved main function to a separate file, added `gzip__process_files` option in the `gzip` module

### Removed

- `template-simpleblog` moved to a separate repository
