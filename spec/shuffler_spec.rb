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

  describe '#mix' do
    it 'takes two inputs' do
      pending
    end

    it 'zips the two inputs' do
      pending
    end

    it 'flattens the result' do
      pending
    end

    it 'removes nil values' do
      pending
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