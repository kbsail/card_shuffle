require_relative('spec_helper')


describe Shuffler do
  let(:deck) { Deck.new(52) }
  let(:dealer) { Shuffler.new(deck, 25) }

  describe '#new' do
    it 'is a shuffler object' do
      expect(dealer).to be_an_instance_of(Shuffler)
    end

    it 'has a deck of cards' do
      expect(dealer.deck).to be_an_instance_of(Deck)
    end

    it 'can access the cards' do
      expect(dealer.all_cards).to be_an_instance_of(Array)
    end

  end

  describe '#top_break' do
    it 'returns the top cards' do
      expect(dealer.top_break.last).to eq(52)
    end

    it 'returns the n number of cards' do
      expect(dealer.top_break.length).to eq(25)
    end

  end

  describe '#bottom_break' do
    it 'returns the bottom cards' do
      expect(dealer.bottom_break.first).to eq(1)
    end

    it 'returns the remaining cards' do
      expect(dealer.bottom_break.length).to eq(27)
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
    context 'with valid arguments' do
      
      it 'calls #bottom_break' do
        expect(dealer).to receive(:bottom_break).and_return((1..27).to_a)
        dealer.shuffle
      end

      it 'calls #top_break' do
        expect(dealer).to receive(:top_break).and_return((28..52).to_a)
        dealer.shuffle
      end

      it 'zips the two sides' do
        expect(dealer.shuffle).to be_an_instance_of(Array)
      end

      context 'with a larger top break' do

        let(:large_shuffler) { Shuffler.new(deck, 30) }

        it 'returns an array with last cards in order(top cards)' do
          large_shuffler.shuffle
          expect(large_shuffler.all_cards[0..2]).to eq([23,1,24])
          expect(large_shuffler.all_cards[-3..-1]).to eq([50,51,52])
        end
      end

      context 'with a smaller top break' do
        
        let(:small_shuffler) { Shuffler.new(deck, 20) }

        it 'returns an array with last cards in order(bottom cards)' do
          small_shuffler.shuffle
          expect(small_shuffler.all_cards[0..2]).to eq([33,1,34])
          expect(small_shuffler.all_cards[-3..-1]).to eq([30,31,32])
        end
      end 

    end
  end

  describe '#equal_original?' do
    let(:shuffled) { dealer.shuffle }

    it 'takes cards as input' do
      expect(dealer).to receive(:equal_original?) do |arg1|
        expect(arg1).to be_an_instance_of(Array)
        expect(arg1.length).to eq(52)
      end
      dealer.equal_original?(shuffled)
    end

    context 'with cards NOT in original order' do
      it 'returns false' do
        dealer.shuffle
        expect(dealer.equal_original?).to eq(false)
      end
    end

    context 'with cards in original order' do
      it 'returns true' do
        expect(dealer.equal_original?).to eq(true)
      end
    end

  end

  describe '#shuffle_to_start' do

    it 'calls shuffle' do
      expect(dealer).to receive(:shuffle).at_least(:once)
      dealer.shuffle_to_start
    end

    it 'checks if the order equals original order' do
      expect(dealer).to receive(:equal_original?).at_least(:once)
      dealer.shuffle_to_start
    end

    context 'with non-original order' do
      it 'shuffles the cards again' do
        expect(dealer).to receive(:shuffle).at_least(:twice)
        dealer.shuffle_to_start
      end

      it 'adds 1 to counter' do
        dealer.shuffle_to_start
        expect(dealer.all_cards).to eq(1)
      end

    end

    context 'with the original order' do
      it 'returns the number of shuffles' do
        pending
      end
    end

  end

end