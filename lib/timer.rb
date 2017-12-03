module Timer

  def completion_time
    Time.now - @start_time
  end

  def minutes
    (completion_time / 60).round
  end

  def seconds
    (completion_time % 60).round
  end
end
