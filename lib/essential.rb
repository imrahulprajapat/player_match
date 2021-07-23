# frozen_string_literal: true

module Essential
  def self.is_number?(string)
    true if Float(string)
  rescue StandardError
    false
  end
end
