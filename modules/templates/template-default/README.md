# Default template for Bash SSG
All files in `js` and `css` directory will be merged to `assets/template-default.js` and `assets/template-default.css` files.  
If you want include other files, use `static` module.
* `css` - styles
* `js` - scripts
* `parts` - HTMLs: top and bottom part
* `resources` - middle parts for modules
* `template.rc` - script that setups template in `generated` directory, condenses scripts and styles and prints template parts and resources

# Resources
This template supports the following modules:
* posts
* posts-tags

# Patching template
Create `database/templates/template-default.patches`, place new files in this directory (keep template's directory tree) and edit.
