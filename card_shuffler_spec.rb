require_relative('card_shuffler')

describe Shuffler do
  let(:dealer) { Shuffler.new(52, 20) }

  describe '#new' do
    it 'is a shuffler object' do
      expect(dealer).to be_an_instance_of(Shuffler)
    end

    it 'has cards' do
      expect(dealer.cards.length).to eq(52)
    end

    it 'accesses the cards' do
      expect(dealer.cards).to be_an_instance_of(Array)
    end

  end

  describe '#cut_deck' do

    before { dealer.cut_deck }

    describe '#top' do
      it 'returns top cards' do
        expect(dealer.top.first).to eq(33)
        expect(dealer.top[12]).to eq(45)
        expect(dealer.top.last).to eq(52)
      end

      it 'returns the cut number of cards' do
        expect(dealer.top.length).to eq(20)
      end
    end
    
    describe '#bottom' do
      it 'returns bottom cards' do
        expect(dealer.bottom.first).to eq(1)
        expect(dealer.bottom[12]).to eq(13)
        expect(dealer.bottom.last).to eq(20)
      end

      it 'returns remaining cards' do
        expect(dealer.bottom.length).to eq(20)
      end
    end

    describe '#extra' do
      it 'returns extra cards' do
        expect(dealer.extra.first).to eq(21)
        expect(dealer.extra[6]).to eq(27)
        expect(dealer.extra.last).to eq(32)
      end

      it 'returns remaining cards' do
        expect(dealer.extra.length).to eq(12)
      end
    end
  end


  describe '#mix_cut_cards' do
    before do
      dealer.cut_deck
      dealer.mix_cut_cards
    end
    
    it 'mixes the stacks together' do
      expect(dealer.cards[0]).to eq(33)
      expect(dealer.cards[1]).to eq(1)
      expect(dealer.cards[2]).to eq(34)
      expect(dealer.cards[3]).to eq(2)
      expect(dealer.cards[4]).to eq(35)
      expect(dealer.cards[5]).to eq(3)
    end
  end

  describe '#add_extra_cards' do
    before do
      dealer.cut_deck
      dealer.mix_cut_cards
      dealer.add_extra_cards
    end

    it 'adds cards in a row to the top' do
      expect(dealer.cards[41]).to eq(22)
      expect(dealer.cards[48]).to eq(29)
      expect(dealer.cards[51]).to eq(32)
    end

  end

  describe '#shuffle' do
    context 'testing bottom deck' do
      it 'changes card position 0' do
        expect{dealer.shuffle}.to change{dealer.cards[0]}.from(1).to(33)
      end

      it 'changes card position 1' do
        expect{dealer.shuffle}.to change{dealer.cards[1]}.from(2).to(1)
      end

      it 'changes card position 2' do
        expect{dealer.shuffle}.to change{dealer.cards[2]}.from(3).to(34)
      end

      it 'changes card position 3' do
        expect{dealer.shuffle}.to change{dealer.cards[3]}.from(4).to(2)
      end
    end

    context 'testing mid deck' do
      it 'changes card position 24' do
        expect{dealer.shuffle}.to change{dealer.cards[24]}.from(25).to(45)
      end

      it 'changes card position 24' do
        expect{dealer.shuffle}.to change{dealer.cards[25]}.from(26).to(13)
      end
    end

    context 'testing end of deck' do
      it 'changes card position 50' do 
        expect{dealer.shuffle}.to change{dealer.cards[50]}.from(51).to(31)
      end

      it 'moves cards by cut size' do
        expect{dealer.shuffle}.to change{dealer.cards[51]}.by(-20)
      end
    end
  end
end

describe Counter do
  let(:dealer) { Shuffler.new(52,20) }
  let(:counter) { Counter.new(dealer) } 

  describe '#check_deck' do
    
    before { 2.times {counter.shuffle_cards} }

    it 'removes individual card index when equal to original card index' do
      expect{counter.check_deck}.to change{counter.card_indices.length}
    end

    it 'adds the loop number card_cycles array' do
      expect{counter.check_deck}.to change{counter.card_cycles.length}
    end

    it 'checks each card against the original order' do
      expect(counter).to receive(:card_eq_original?).at_least(:once)
      counter.check_deck
    end

  end

  describe '#one_cycle' do

    it 'calls shuffle_cards' do
      expect(counter).to receive(:shuffle_cards).at_least(:once)
      counter.one_cycle
    end

    it 'calls #check_deck' do
      expect(counter).to receive(:check_deck).at_least(:once)
      counter.one_cycle
    end

    it 'adds 1 to the shuffle_count' do
      expect{counter.one_cycle}.to change{counter.shuffle_count}.by(1)
    end
  end

  describe '#find_all_card_cycles' do
    context 'with card cycles left' do
      it 'removes all values from card_indices' do
        expect{counter.find_all_card_cycles}.to change{counter.card_indices.length}.from(52).to(0)
      end

      it 'returns the unique card cycle values' do
        expect(counter.find_all_card_cycles).to eq(counter.card_cycles)
      end
    end

    context 'with all card cycles found' do
      before do 
        counter.stub(:card_indices).and_return([])
      end

      it 'returns the card_indices' do
        expect(counter).to receive(:card_cycles)
        expect(counter).not_to receive(:one_cycle)
        counter.find_all_card_cycles
      end
    end
  end

  describe '#find_least_shuffles' do
    before { counter.stub(:card_cycles).and_return([7,3]) }
    
    it 'finds the least common multiple of card_cycles' do
      expect(counter.find_least_shuffles).to eq(21)
    end
  end

  describe '#shuffles_to_start' do
    it 'returns the number of shuffles to return to the beginning' do
      expect(counter.shuffles_to_start).to eq(counter.least_shuffles)
    end
  end

end