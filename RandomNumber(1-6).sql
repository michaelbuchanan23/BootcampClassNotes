Declare @HighScore int
Declare @Dicenum int
Declare @LoopCnt int
Declare @GameNums int
Declare @TotScore int
set @HighScore = 0
Set @GameNums = 0
set @TotScore = 0
    set @LoopCnt=0
 --Loop until the score is greater than 500
while @HighScore < 150 begin
    --This is the dice roll
    set @Dicenum =  Round(RAND()*(6-1)+1,0)
    --Logical test to see if the dice is greater than 1
    If @Dicenum >= 2 begin
        --Increment the loop counter
        set @LoopCnt = @LoopCnt +1
        --set the total score = to the score plus whatever was rolled on the dice
        set @TotScore = @TotScore + @Dicenum
        End
    else begin
    --GameNums counts the number games played, just a running count
        set @GameNums=@GameNums+1
        -- if you rolled a 1
        --If your total score is greater than your maximum score
        If @TotScore>@HighScore 
            --set the max number (high score) to the total score
            set @HighScore=@TotScore
            -- reset loop counter
            set @LoopCnt=0
            -- reset total score
            set @TotScore=0
    end
End
    --print out the high score
    print concat('Your high score is ', @HighScore)
    -- print out the total number of times the dice was rolled
    print concat('The total number of games taken to do it ',  @GameNums)