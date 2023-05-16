class LogLineParser
  attr_reader :message
  attr_reader :log_level

  def initialize(line)
    matches = line.match(/\[(.*)\]:(.*)/)
    # matches[0] is the entire line
    @log_level = matches[1].downcase
    @message = matches[2].strip
  end

  def reformat
    "#{@message} (#{@log_level})"
  end
end
