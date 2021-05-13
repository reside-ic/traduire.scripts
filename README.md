# traduire-scripts

Contains R script which might help when collating strings when asking for translations. The functions in here are just untested quick things and shouldn't be relies on for anything.

TODO: Allow adding a date since - to only show new strings since that date

Functions
* make_translation_summary - takes `output_path` and variable number of additional args which are path to traduire directories. This will take all translation files in each traduire directory and save out as a spreadsheet (one sheet per traduire dir) with keys, and a column for each of the languages available
