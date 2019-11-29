# Gothello evaluation data collection

These shell scripts can be used to collect Gothello position
evaluations using negamax search lookahead via Grossthello.
Keep in mind that Grossthello's evaluator is simple
stone-count, so it won't be too great.

The scripts assume that your directory structure is

        gothello-grossthello/
        gothello-gthd/
        gothello-project/data/

From this `data` directory, first run `sh makejars.sh`. This
script will go to the Grossthello and Gthd projects and make
`jar` files of those programs in this `data` directory,
freezing the version of these projects that is being used.

Next run `sh getdata.sh`. This script make a `runs`
directory to hold the logfiles if one does not already
exist.  It then starts Gthd runs games with Grossthello
playing both sides with logging turned on, creating a
directory per game with relevant information.

The game directories will be named using the run number
(autoincremented each run of `getdata.sh`) and the game
serial number, for example `1-23` for run 1 game 23.
Each game directory contains:

* `date`: The run date and time in ISO format.
* `gthd`: `stdout` and `stderr` from Gthd for the game.
* `black-output`: `stdout` from Grossthello playing black.
* `black-log`: `stderr` from Grossthello playing black.
  This is the game log for black.
* `white-output`: `stdout` from Grossthello playing white.
* `white-log`: `stderr` from Grossthello playing white.
  This is the game log for white.
