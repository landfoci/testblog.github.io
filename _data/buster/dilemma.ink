# author: Buster Benson
# title: DILEMMA

VAR round = 1
LIST opponent = (none), frog, duck, snake, mouse
VAR your_score = 0
VAR their_score = 0

-> Start

=== Start ===
Who would you like to play?
~ opponent -= opponent
~ round = 1
~ your_score = 0
~ their_score = 0

+ An innocent-looking duck on a bench.
    ~ opponent = duck
    -> AllCooperate
+ A random-looking frog hopping on the grass.
    ~ opponent = frog
    -> Random
+ A mean-looking snake in the bushes.
    ~ opponent = snake
    -> AllDefect
+ A wise-looking mouse in a tree.
    ~ opponent = mouse
    -> TitForTat

=== Random ===
You approach the random-looking frog and ask if they'd like to play Dilemma with you.

The frog accepts. -> RoundStart

= RoundStart
ROUND {round} begins. Do you:
~ temp their_move = RANDOM(0,1)

+ [Cooperate]
    ~ PlayRound(1, their_move)
    
+ [Defect]
    ~ PlayRound(0, their_move)

- Want to keep playing?
+ [Play again.] -> RoundStart
+ [I think I'm done.] -> Done
-> Done


=== AllCooperate ===
You approach the innocent-looking duck and ask if they'd like to play Dilemma with you.

The duck accepts. -> RoundStart

= RoundStart
ROUND {round} begins. Do you:
~ temp their_move = 1

+ [Cooperate]
    ~ PlayRound(1, their_move)
    
+ [Defect]
    ~ PlayRound(0, their_move)
    
- Want to keep playing?
+ [Play again.] -> RoundStart
+ [I think I'm done.] -> Done

-> Done


=== AllDefect ===
You approach the mean-looking snake and ask if they'd like to play Dilemma with you.

The snake acceptsssssss. -> RoundStart

= RoundStart
ROUND {round} begins. Do you:
~ temp their_move = 0

+ [Cooperate]
    ~ PlayRound(1, their_move)
    
+ [Defect]
    ~ PlayRound(0, their_move)
    
- Want to keep playing?
+ [Play again.] -> RoundStart
+ [I think I'm done.] -> Done

-> Done


=== TitForTat ===
~ temp your_last_move = -1

You approach the wise-looking mouse and ask if they'd like to play Dilemma with you.

The mouse accepts. -> RoundStart(your_last_move)

= RoundStart(your_last_move)
ROUND {round} begins. Do you:

~ temp their_move = 1
{ 
- your_last_move == 0:
    ~ their_move = 0
}

+ [Cooperate]
    ~ PlayRound(1, their_move)
    ~ your_last_move = 1
    
+ [Defect]
    ~ PlayRound(0, their_move)
    ~ your_last_move = 0
    
- Want to keep playing?
+ [Play again.] -> RoundStart(your_last_move)
+ [I think I'm done.] -> Done

-> Done


=== function PlayRound(your_move, their_move)
{
- your_move: 
    { their_move: 
            ~ your_score += 3
            ~ their_score += 3
            You both cooperate. You both get 3 points.
        - else:
            ~ your_score += 0
            ~ their_score += 5
            You cooperate, but they defect. They get 5 points, you get 0.
        }    
- else: 
    { their_move: 
            ~ your_score += 5
            ~ their_score += 0
            You defect, but they cooperate. You sly dog. You get 5 points, they get 0.
        - else:
            ~ your_score += 1
            ~ their_score += 1
            You both defect, so just 1 point for both of you.
        }
}

- Round {round} results: Your score: {your_score}. Their score: {their_score}.
~ round += 1


=== Done ===
After {round-1} rounds, you walk away with {your_score} points to the {opponent}'s {their_score} points. 
{ 
- your_score > their_score: 
    Well-played.
- your_score == their_score: 
    A cat's game.
- else: 
    Maybe next time.
}
+ Look for another game.
    -> Start
- -> DONE

