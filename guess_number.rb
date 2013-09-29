class GuessNumber

    attr_reader :generated_number, :counter

    def initialize
        @generated_number = rand(1..100)
        @counter = 0
    end
end
