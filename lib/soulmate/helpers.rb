# -*- encoding : utf-8 -*-
require 'active_support/core_ext/string'
module Soulmate
  module Helpers

    def prefixes_for_phrase(phrase)
      words = normalize(phrase).split(' ').reject do |w|
        Soulmate.stop_words.include?(w)
      end
      words.map do |w|
        (MIN_COMPLETE-1..(w.length-1)).map{ |l| w[0..l] }
      end.flatten.uniq
    end

    def normalize(str)
      str.mb_chars.downcase.gsub(/[^0-9а-яa-z ]/i, '').strip
    end

  end
end