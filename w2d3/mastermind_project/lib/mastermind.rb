require_relative "code"

class Mastermind

    def initialize(n)
        @secret_code = Code.random(n)
    end

    def print_matches(guess)
        puts "Exact match count #{@secret_code.num_exact_matches(guess)}"
        puts "Near match count #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts "Enter a code: "
        code = gets.chomp
        guessed = Code.from_string(code)
        print_matches(guessed)
        @secret_code == guessed
    end

end