class Attendee
  attr_reader :height
  attr_reader :pass_id

  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    issue_pass!(nil)
  end
end
