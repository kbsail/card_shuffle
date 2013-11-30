require_relative('spec_helper')


describe Shuffler do
  let(:deck) { Deck.new(52) }
  let(:dealer) { Shuffler.new(deck) }

  describe '#new' do
    it 'is a shuffler object' do
      expect(dealer).to be_an_instance_of(Shuffler)
    end

    it 'has a deck of cards' do
      expect(dealer.deck).to be_an_instance_of(Deck)
    end

    it 'can access the cards' do
      expect(dealer.cards).to be_an_instance_of(Array)
    end

  end

  describe '#top_break' do
    it 'returns the top cards' do
      expect(dealer.top_break(27).last).to eq(52)
    end

    it 'returns the n number of cards' do
      expect(dealer.top_break(27).length).to eq(27)
    end

  end

  describe '#bottom_break' do
    it 'returns the bottom cards' do
      expect(dealer.bottom_break(25).first).to eq(1)
    end

    it 'returns the remaining cards' do
      expect(dealer.bottom_break(27).length).to eq(25)
    end
  end

  describe '#zipped' do
    let(:input1) { [1,2,3] }
    let(:input2) { [4,5,6] }
    let(:zipped) { dealer.zipped(input1, input2) }

    it 'takes two inputs' do
      expect(dealer).to receive(:zipped) do |arg1, arg2|
        expect(arg1).to be_an_instance_of(Array)
        expect(arg2).to be_an_instance_of(Array)
        expect(arg1).to_not eq(arg2)
      end
      zipped
    end

    it 'returns an non-nested array' do
      expect(dealer.zipped([1,2,3], [4,5,6])).to eq([1,4,2,5,3,6])
    end


  end

  describe '#shuffle' do
    it 'takes an argument (number)' do
      expect{dealer.shuffle}.to raise_error(ArgumentError)
    end

    context 'with valid arguments' do
      
      it 'calls #bottom_break' do
        expect(dealer).to receive(:bottom_break)
        dealer.shuffle(25)
      end

      it 'calls #top_break' do
        expect(dealer).to receive(:top_break)
        dealer.shuffle(25)
      end

      it 'zips the two sides' do
        expect(dealer.shuffle(25)).to be_an_instance_of(Array)
      end

    end
  end

end