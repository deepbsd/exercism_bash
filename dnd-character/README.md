# D&D Character

For a game of [Dungeons & Dragons][DND], each player starts by generating a
character they can play with. This character has, among other things, six
abilities; strength, dexterity, constitution, intelligence, wisdom and
charisma. These six abilities have scores that are determined randomly. You
do this by rolling four 6-sided dice and record the sum of the largest three
dice. You do this six times, once for each ability.

Your character's initial hitpoints are 10 + your character's constitution
modifier. You find your character's constitution modifier by subtracting 10
from your character's constitution, divide by 2 and round down.

Write a random character generator that follows the rules above.

For example, the six throws of four dice may look like:

* 5, 3, 1, 6: You discard the 1 and sum 5 + 3 + 6 = 14, which you assign to strength.
* 3, 2, 5, 3: You discard the 2 and sum 3 + 5 + 3 = 11, which you assign to dexterity.
* 1, 1, 1, 1: You discard the 1 and sum 1 + 1 + 1 = 3, which you assign to constitution.
* 2, 1, 6, 6: You discard the 1 and sum 2 + 6 + 6 = 14, which you assign to intelligence.
* 3, 5, 3, 4: You discard the 3 and sum 5 + 3 + 4 = 12, which you assign to wisdom.
* 6, 6, 6, 6: You discard the 6 and sum 6 + 6 + 6 = 18, which you assign to charisma.

Because constitution is 3, the constitution modifier is -4 and the hitpoints are 6.

## Notes

Most programming languages feature (pseudo-)random generators, but few
programming languages are designed to roll dice. One such language is [Troll].

[DND]: https://en.wikipedia.org/wiki/Dungeons_%26_Dragons
[Troll]: http://hjemmesider.diku.dk/~torbenm/Troll/


Run the tests with:

```bash
bats dnd_character_test.sh
```

After the first test(s) pass, continue by commenting out or removing the
`[[ $BATS_RUN_SKIPPED == true ]] || skip` 
annotations prepending other tests.

To run all tests, including the ones with `skip` annotations, run:

```bash
BATS_RUN_SKIPPED=true bats dnd_character_test.sh
```

## Source

Simon Shine, Erik Schierboom [https://github.com/exercism/problem-specifications/issues/616#issuecomment-437358945](https://github.com/exercism/problem-specifications/issues/616#issuecomment-437358945)


## External utilities
`Bash` is a language to write "scripts" -- programs that can call
external tools, such as
[`sed`](https://www.gnu.org/software/sed/),
[`awk`](https://www.gnu.org/software/gawk/),
[`date`](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html)
and even programs written in other programming languages, 
like [`Python`](https://www.python.org/).
This track does not restrict the usage of these utilities, and as long
as your solution is portable between systems and does not require
installation of third party applications, feel free to use them to solve
the exercise.

For an extra challenge, if you would like to have a better understanding
of the language, try to re-implement the solution in pure `Bash`,
without using any external tools. Note that there are some types of
problems that bash cannot solve, such as performing floating point
arithmetic and manipulating dates: for those, you must call out to an
external tool.

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others
have completed the exercise.
