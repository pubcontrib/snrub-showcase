# tip-calculator
> Program which takes a bill (total amount in any currency), tip (percent), and
scale (number of digits for the decimal half of numbers) then returns the
amount needed for the tip.

## Running
If you'd like to run the program directly, you can invoke the `snrub` program
directly with the entry script and number as arguments.
```sh
cd src
snrub -f entry.txt "[#15000# #20# #2#]"
```

## Testing
Testing requires `sh` but can be an automated way to verify your version of
`snrub` executes this program's scripts correctly.
```sh
sh test/run.sh
```

Last tested with Snrub version `v0.67.1`.
