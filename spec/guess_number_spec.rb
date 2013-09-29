require "spec_helper"

describe GuessNumber do

    describe "#new" do
        before :all do
            @gn = GuessNumber.new
        end

        it "return a new GuessNumber object" do
            @gn.should be_instance_of GuessNumber
        end

        it "has a generated number" do
            @gn.should respond_to :generated_number
        end
        
        it "has a counter" do
            @gn.should respond_to :counter
        end

        context "generated number" do
            
            subject { @gn.generated_number }

            it "should be integer" do
                subject.should be_an_integer    
            end

            it "should be greater than or equal to 1" do
                expect(subject).to be >= 1
            end
            
            it "should be less than or equal to 100" do
                expect(subject).to be <= 100
            end
        end
    end

end
