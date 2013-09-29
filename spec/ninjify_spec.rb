require_relative 'spec_helper'

describe Ninjify do

  subject(:ninjify) { Ninjify.new }


  {
      'joe' => 'Zumoku', # basic
      'Joe' => 'Zumoku', # upper case
      'john doe' => 'Zumorito Temoku', # more names
      'Johannes Thönes' => 'Zumorikatotokuari Chirimokutokuari', # German Special Characters
      'Ä Ö Ü' => 'Kaku Moku Doku', # German Special Characters
      'René Française' => 'Shikutoku Lushikatomikakiariku', # French special characters
      'H€£d' => 'Ri€£te', # Just keep unknown letters
  }.each do |normal_name, ninja_name|

    it "should encoude '#{normal_name}' to '#{ninja_name}'" do
      ninjify.ninjify(normal_name).should eql(ninja_name)
    end

  end


end