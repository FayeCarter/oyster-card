class Oystercard
  attr_reader :balance, :limit, :in_journey, :entry_station, :journey_history 
  CARD_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @limit = CARD_LIMIT
    @in_journey = in_journey
    @entry_station = entry_station
    @journey_history = []
  end
  
  def top_up(money)
    if @balance + money > @limit
      raise 'exceeded limit of £90!'
    else
      @balance += money
    end
  end

  private def deduct
    @balance -= MINIMUM_FARE
  end 

  def touch_in(entry_station)
    raise "Balance too low" if @balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out (exit_station)
    @journey_history << [@entry_station, exit_station]
    @in_journey = false
    deduct
    @entry_station = nil
  end

  def get_entry_station
    @entry_station
  end
end
