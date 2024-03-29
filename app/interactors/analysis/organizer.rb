# frozen_string_literal: true

class Analysis::Organizer
  include Interactor::Organizer

  organize Analysis::CheckParameter,
           Analysis::ParseText,
           Analysis::FormatStem,
           Analysis::GetTranslation,
           Analysis::FormatResponse
end
