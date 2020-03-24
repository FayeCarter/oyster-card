class Oystercard
  attr_reader :balance, :limit, :in_journey
  CARD_LIMIT = 90

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @limit = CARD_LIMIT
    @in_journey = in_journey
  end

  def top_up(money)
    if @balance + money > @limit
      raise 'exceeded limit of £90!'
    else
      @balance += money
    end
  end

  def deduct(fair)
    @balance - fair
  end 

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
