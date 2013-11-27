require_relative "spec_helper"


describe Deck do
  let(:card_deck) { Deck.new(100) }

  describe '#new' do
    it 'creates a new deck' do
      expect(card_deck).to be_an_instance_of(Deck)
    end

    context 'with cards' do
      subject(:cards) { card_deck.cards }
      
      it { should be_an_instance_of(Array)}

      it 'has n(100) cards' do
        expect(cards.length).to eq(100)
      end

      it 'begins with 1' do
        expect(cards[0]).to eq(1)
      end

      it 'ends with n(100)' do
        expect(cards[-1]).to eq(100)
      end
      
    end

  end


end