
class TennisGame1

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      @p1points += 1
    else
      @p2points += 1
    end
  end

  def score
    result = ""
    tempScore=0
    if (@p1points==@p2points)
      result = {
          0 => "Love-All",
          1 => "Fifteen-All",
          2 => "Thirty-All",
      }.fetch(@p1points, "Deuce")
    elsif (@p1points>=4 or @p2points>=4)
      minusResult = @p1points-@p2points
      if (minusResult==1)
        result ="Advantage " + @player1Name
      elsif (minusResult ==-1)
        result ="Advantage " + @player2Name
      elsif (minusResult>=2)
        result = "Win for " + @player1Name
      else
        result ="Win for " + @player2Name
      end
    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @p1points
        else
          result+="-"
          tempScore = @p2points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end
end

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end

  def get_points(players_points)
    score = {
      0 => "Love",
      1 => "Fifteen",
      2 => "Thirty",
      3 => "Forty"
    }
    score[players_points]
  end

  def get_player_score(p1score, p2score)
    p1score + "-" + p2score
  end

  def score_is_equal
    result = ""
    if @p1points == @p2points && @p1points < 3
      result = get_points(@p1points)
      result += "-All"
    else
      "Deuce"
    end
  end

  def get_player_advantage(p1points, p2points)
    if p1points > p2points
      "Advantage " + @player1Name
    else
      "Advantage " + @player2Name
    end
  end

  def player_1_has_advantage?
    @p1points > @p2points and @p2points >= 3
  end

  def player2_has_advantage?
     @p2points > @p1points and @p1points >= 3
  end

  def player_1_has_won?
    @p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2
  end

  def player_2_has_won?
    @p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2
  end

  def score
    if @p1points == @p2points
      result = score_is_equal
    end

    p1result = ""
    p2result = ""

    if (@p1points > 0 && @p1points <= 3 && @p2points==0)
      p1result = get_points(@p1points)
      p2result = "Love"
      result = get_player_score(p1result, p2result)
    end

    if (@p2points > 0 && @p2points <= 3 && @p1points==0)
      p2result = get_points(@p2points)
      p1result = "Love"
      result = get_player_score(p1result, p2result)
    end

    if (@p1points > @p2points and @p1points < 4)
      if (@p1points == 2)
        p1result = "Thirty"
      end
      if (@p1points == 3)
        p1result = "Forty"
      end
      if (@p2points == 1)
        p2result = "Fifteen"
      end
      if (@p2points == 2)
        p2result = "Thirty"
      end
      result = p1result + "-" + p2result
    end
    if (@p2points > @p1points and @p2points < 4)
      if (@p2points == 2)
        p2result = "Thirty"
      end
      if (@p2points == 3)
        p2result = "Forty"
      end
      if (@p1points == 1)
        p1result = "Fifteen"
      end
      if (@p1points == 2)
        p1result = "Thirty"
      end
      result = p1result  + "-" + p2result
    end

    if player_1_has_advantage?
      result = get_player_advantage(@p1points, @p2points)
    elsif player2_has_advantage?
      result = get_player_advantage(@p1points, @p2points)
    end

    if player_1_has_won?
      result = "Win for " + @player1Name
    end
    if player_2_has_won?
      result = "Win for " + @player2Name
    end
    result
  end

  def p1Score
    @p1points +=1
  end

  def p2Score
    @p2points +=1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end

  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
