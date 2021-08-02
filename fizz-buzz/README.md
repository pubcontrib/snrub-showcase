# fizz-buzz
> Program which takes a counting number (0, 1, 2, ...) and returns that many
turns in the game of FizzBuzz.

## Rules
The game of FizzBuzz is a simple counting game to help young mathematicians
learn about divisibility. The player starts at the number one and counts upwards
applying these rules with each number:

- If the number is divisible by 3 and not 5, the player says "Fizz".
- If the number is divisible by 5 and not 3, the player says "Buzz".
- If the number is divisible by 3 and 5, the player says "Fizz Buzz".
- If the number is neither divisible by 3 or 5, the player says the number.

For example if the game was played for 5 turns you should hear the player say:

1.  "One"
2.  "Two"
3.  "Fizz"
4.  "Four"
5.  "Buzz"

The game can be played solo where a judge listens for each response failing the
player if they take too long or give a wrong answer. For more of a challenge the
game could be played with many players in the form of a battle royale. Since
this is a simple computer program simulating the thinking process of a player we
will keep things simple. You tell the computer player how many turns it should
go for and it will give you all of the correct responses in order.

## Running
A Shell script is included to provide a conversational interface for the
fizz-buzz program. This is included purely for convenience. Assuming both `sh`
and `snrub` are both available by those names you can run the program by
executing the prompt script.
```sh
sh prompt.sh
```

If you'd like to run the program directly, you can invoke the `snrub` program
directly with the entry script and number as arguments.
```sh
cd src
snrub -f entry.txt "#100#"
```

## Testing
Testing requires `sh` but can be an automated way to verify your version of
`snrub` executes this program's scripts correctly.
```sh
sh test/run.sh
```

Last tested with Snrub version `v0.67.1`.
