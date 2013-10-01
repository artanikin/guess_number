#!/usr/bin/env ruby

class GuessNumber

    attr_accessor :generated_value, :counter

    def initialize
        @generated_value = rand(1..10)
        @counter = 0
    end
    
    def start
        while @input_value != @generated_value do
            print "\nInput number >> "

            @input_value = gets.downcase.chomp

            if numeric? @input_value
                @input_value = @input_value.to_i
                    
                if @input_value < @generated_value
                    puts "greater"
                elsif @input_value > @generated_value
                    puts "less"    
                end
            else
                puts "This is not numeric"
            end
            @counter += 1
        end
        puts "Congratulations! You guessed the number #{@generated_number} after #{@counter} attempts."
    end
    
    private

        def numeric? value
            Float(value) != nil rescue false
        end
end

if __FILE__ == $0
    guess = GuessNumber.new
    guess.start
end
