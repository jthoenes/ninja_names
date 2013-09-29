class Ninjify

  NINJA_ALPHABET = {
      'a' => 'ka',
      'b' => 'zu',
      'c' => 'mi',
      'd' => 'te',
      'e' => 'ku',
      'f' => 'lu',
      'g' => 'ji',
      'h' => 'ri',
      'i' => 'ki',
      'j' => 'zu',
      'k' => 'me',
      'l' => 'ta',
      'm' => 'rin',
      'n' => 'to',
      'o' => 'mo',
      'p' => 'no',
      'q' => 'ke',
      'r' => 'shi',
      's' => 'ari',
      't' => 'chi',
      'u' => 'do',
      'v' => 'ru',
      'w' => 'mei',
      'x' => 'na',
      'y' => 'fu',
      'z' => 'zi'
  }

  SPECIAL_CHARACTERS = {
      # German
      'ä' => 'ae',
      'Ä' => 'ae',
      'ö' => 'oe',
      'Ö' => 'oe',
      'ü' => 'ue',
      'Ü' => 'ue',
      'ß' => 'ss',

      # French
      'é' => 'e',
      'à' => 'a',
      'è' => 'e',
      'ù' => 'u',
      'ç' => 'c',
      'ë' => 'e',
      'ï' => 'i',
      'œ' => 'oe',
      'â' => 'a',
      'ê' => 'e',
      'î' => 'i',
      'ô' => 'o',
      'û' => 'u',
  }

  def ninjify(normal_name)
    normal_name.split(/\s+/).map{|word| ninjify_word(word)}.join(' ')
  end

  private
  def ninjify_word(normal_word)
    normal_word.chars.map{|c| ninjify_string(normalize_character(c))}.flatten.join.capitalize
  end

  def normalize_character(char)
    char.downcase!

    (SPECIAL_CHARACTERS[char] || char).chars
  end

  def ninjify_string(chars)
    chars.map{|c| NINJA_ALPHABET[c] || c }
  end

end