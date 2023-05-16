=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end
class Complement
  class << self
    COMPLEMENT_MAP = {
      'C' => 'G',
      'G' => 'C',
      'T' => 'A',
      'A' => 'U',
    }

    def of_dna(sequence)
      sequence
        .split('')
        .map { |nucleotide| COMPLEMENT_MAP[nucleotide] }
        .join('')
    end
  end
end