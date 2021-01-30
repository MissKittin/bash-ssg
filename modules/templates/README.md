# Bash SSG - templates module
This module provides `template__get_part` function, that passes control to the main script from selected template.  
First the function looks for a template in `database/templates`. If not found, looks in `modules/templates`.  
To override template, copy template directory from `modules/templates` to the `database/templates` and edit.
