# Tennis Kata

This Kata is about implementing a simple tennis game. I came up with it while thinking about Wii tennis, where they have simplified tennis, so each set is one game.

The scoring system is rather simple:
- Each player can have either of these points in one game 0 15 30 40
- If you have 40 and you win the ball you win the game, however there are special rules.
- If both have 40 the players are deuce.
    - If the game is in deuce, the winner of a ball will have advantage and game ball.
    - If the player with advantage wins the ball they win the game.
    - If the player without advantage wins they are back at deuce.
    
#### Running the tests

```{r, engine='bash', count_lines}
$ git clone https://github.com/elena-vi/tennis.git && cd tennis/ && bundle && rspec
```


_Feedback, issues and PRs are welcomed!_