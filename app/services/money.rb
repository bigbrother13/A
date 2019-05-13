class Money
  def initialize(params)
    @notes = params
  end

  def withdraw(sum)
    path = withdraw_strategy(sum)
    if path
      path.each { |val| @notes[val] -= 1 }
    else
      p 'Not enough money'
    end
    path
  end

  def withdraw_paths(sum, notes = @notes)
    res = []
    available_notes = notes.select { |k, v| k <= sum && v > 0 }.keys
    available_notes.each do |note|
      if sum == note
        res << [note]
      else
        paths = withdraw_paths(sum - note, notes.merge(note => notes[note] - 1))
        paths.each { |variant| res << [note] + variant }
      end
    end
    res.map(&:sort).uniq
  end

  private

  def withdraw_strategy(sum)
    withdraw_paths(sum).first
  end
end
