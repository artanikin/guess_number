require "spec_helper"

describe GuessNumber do
    
    let(:guess) { GuessNumber.new }
    

    describe "#new" do
        it { should be_instance_of GuessNumber }

        it "counter equal 0" do
           guess.counter.should eql 0
        end

        it "generated number in range" do
            (1..10).should be_include guess.generated_value
        end
    end


    describe "#start" do

       before do
          guess.generated_value = 5
          guess.stub(:gets).and_return "1", "3", "6", "string", "5"

          input_in_file("./tmp/out") { guess.start }
          @output = read_from_file("./tmp/out")
       end


       it "print \"Input number >>\"" do
            @output[0].should match /Input number >>/i
       end     

       it "print \"less\"" do
            @output[2].should match /less/i 
       end

       it "print \"greater\"" do
            @output[1].should match /greater/i
       end

       it "print \"Congratulations\"" do
            @output.last.should match /Congratulations/i
       end

       it "print \"This is not numeric\"" do
            @output[3].should =~ /This is not numeric/i
       end
       it { guess.counter.should be_eql 5 }

    end


    describe "numeric?" do
        it { guess.should be_numeric "5" }
        it { guess.should_not be_numeric "string" }
    end

end
