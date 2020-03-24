require 'oystercard'

describe Oystercard do

  let(:card) {Oystercard.new}
  
  it "has a #balance" do
    expect(subject::balance).to eq 0
  end

  it "user can #top_up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "#top_up adds money to card" do
    card.top_up(5)
    expect(card::balance).to eq 5
  end

  it "#deduct fair from balance" do
    card.top_up(5)
    card.deduct(5)
    expect(subject::balance).to eq 0
  end

  describe 'top_up' do
    it "limits the customer to a max of £90" do
    expect{subject.top_up(91)}.to raise_error
  end

  it "checks to see the limit is £90" do
    expect(subject::limit).to eq 90
  end
  end

  it "has a an option for the user to touch in" do 
    expect(subject).to respond_to(:touch_in )
  end 

  it "Determains if the user is currently in a journy" do
    expect(card::in_journey).to eq false
  end

  it "It registers a users card as in journy" do 
    card.top_up(10)
    card.touch_in
    expect(card::in_journey).to eq true
  end

  it "Allows the user to touch out when the journey is over" do
    expect(subject).to respond_to(:touch_out)
  end

  it "It tracks when the user is no longer in a journey" do  
    card.touch_out
    expect(card::in_journey).to eq false  
  end

  it 'fails to #touch_in if @balance bellow £1' do
    expect{subject.touch_in}.to raise_error "Balance too low"
  end

end
