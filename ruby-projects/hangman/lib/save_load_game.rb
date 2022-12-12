# frozen_string_literal: true

# the module for the saving and loading methods for hangman
module SaveLoadGame
  def ask_for_load; end

  def ask_for_save; end

  def to_json(*_args)
    content = {}
    self.instance_variables.each do |variables|
      content[variables] = self.instance_variable_get variables
    end
    content.to_json
  end

  def from_json!(string)
    JSON.parse(string).each do |variable, value|
      self.instance_variable_set variable, value
    end
  end

  def save_file; end

  def load_file(); end
end
