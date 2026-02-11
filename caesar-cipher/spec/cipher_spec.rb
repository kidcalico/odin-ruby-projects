require './lib/cipher.rb'

describe Cipher do

  describe '#verify_string' do
    context 'returns a string' do
      subject(:cipher) { described_class.allocate }

      before do
        allow(cipher).to receive(:gets).and_return('Hello world')
      end

      it 'returns a string' do
        string = cipher.verify_string
        expect(string).to eq('Hello world') 
      end
    end
  end

  describe '#verify_shift' do
    context 'returns an integer' do
      subject(:cipher) { described_class.allocate }

      before do
        allow(cipher).to receive(:gets).and_return('5')
      end
      it 'returns an integer' do
        shift = cipher.verify_shift
        expect(shift).to eq(5)
      end
    end
  end

  describe '#caesar_cipher' do
  
    context 'accepts a string and an integer and returns an encrypted string' do
      subject(:hello) { described_class.new('Hello', 6) }
      
      it 'accepts "Hello", 6 and returns "Nkrru"' do
        expected = 'Nkrru'
        expect(hello.caesar_cipher).to eq(expected)
      end
      
    end
    
    context 'accepts punctuation without altering it' do
      subject(:goodbye) { described_class.new('Goodbye!', 2) }
      
      it 'accepts "Goodbye!", 2, and returns "Iqqfdag!"' do
        expected = 'Iqqfdag!'
        expect(goodbye.caesar_cipher).to eq(expected)
      end
    end
  end
end
