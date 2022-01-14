require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.include?(peg.upcase) }
  end

  def self.random(n)
    pegs = Array.new(n) { POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(pegs_str)
    pegs = pegs_str.split("")
    self.new(pegs)
  end

  def initialize(pegs)
    if !Code::valid_pegs?(pegs)
      raise "pegs are invalid"
    else
      @pegs = pegs.map { |peg| peg.upcase }
    end
  end 

  def pegs
    @pegs
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count { |i| guess[i] == @pegs[i] }
  end

  def num_near_matches(guess)
    pegs_near = self.pegs.dup
    guess_near = guess.pegs.dup
    (0...guess.length).each do |i| 
      if guess[i] == @pegs[i]
        pegs_near[i] = nil
        guess_near[i] = nil
      end
    end
    # debugger
    pegs_near.delete(nil)
    guess_near.delete(nil)

    count_near = 0
    guess_near.each do |gele|
      if pegs_near.include?(gele)
        count_near += 1
        pegs_near.delete_at(pegs_near.index(gele))
      end
    end
    count_near
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
