require 'spec_helper'
require 'create_spiral'

RSpec.describe CreateSpiral do
  let(:subject) { CreateSpiral.new }
  let(:empty_h) { subject.create_empty_hash }

  describe 'initialization' do
    it 'defaults' do
      expect(subject.max_increment).to eq(3)
      expect(subject.x_ceiling).to eq(2)
      expect(subject.x_base).to eq(0)
      expect(subject.y_ceiling).to eq(2)
      expect(subject.y_base).to eq(0)
      expect(subject.is_clocking).to be_truthy
    end

    describe 'initialization with passed in increment value' do
      let(:subject) { CreateSpiral.new(4) }
      it 'defaults' do
        expect(subject.max_increment).to eq(4)
        expect(subject.x_ceiling).to eq(3)
        expect(subject.x_base).to eq(0)
        expect(subject.y_ceiling).to eq(3)
        expect(subject.y_base).to eq(0)
        expect(subject.is_clocking).to be_truthy
      end
    end

    describe 'initialization with passed in nil value' do
      let(:subject) { CreateSpiral.new(nil) }
      it 'defaults' do
        expect(subject.max_increment).to eq(0)
        expect(subject.x_ceiling).to eq(-1)
        expect(subject.x_base).to eq(0)
        expect(subject.y_ceiling).to eq(-1)
        expect(subject.y_base).to eq(0)
      end
    end

    describe 'initialization with passed in nil value' do
      let(:subject) { CreateSpiral.new(1.1) }
      it 'defaults' do
        expect(subject.max_increment).to eq(1)
        expect(subject.x_ceiling).to eq(0)
        expect(subject.x_base).to eq(0)
        expect(subject.y_ceiling).to eq(0)
        expect(subject.y_base).to eq(0)
      end
    end

    describe 'initialization with passed in nil value' do
      let(:subject) { CreateSpiral.new("") }
      it 'defaults' do
        expect(subject.max_increment).to eq(0)
        expect(subject.x_ceiling).to eq(-1)
        expect(subject.x_base).to eq(0)
        expect(subject.y_ceiling).to eq(-1)
        expect(subject.y_base).to eq(0)
      end
    end

    describe '#create_empty_hash' do
      it 'create_empty_hash works' do
        hash = subject.create_empty_hash
        expect(hash.keys.count).to eq(3)
        expect(hash.keys).to eq(%w[0 1 2])
        expect(hash['0']).to eq({'0'=>nil, '1'=>nil, '2'=>nil})
        expect(hash['1']).to eq({'0'=>nil, '1'=>nil, '2'=>nil})
        expect(hash['2']).to eq({'0'=>nil, '1'=>nil, '2'=>nil})
      end
    end
  end

  describe '#fill_top_right' do
    it '' do
      subject.fill_top_right(empty_h)
      expect(empty_h['0']).to eq({ '0'=>1, '1'=>2, '2'=>3 })
      expect(empty_h['1']).to eq({'0'=>nil, '1'=>nil, '2'=>nil})
      expect(empty_h['2']).to eq({'0'=>nil, '1'=>nil, '2'=>nil})
    end

    describe '#fill_top_right for a larger hash' do
      let(:subject) { CreateSpiral.new(5) }
      let(:empty_h) { subject.create_empty_hash }
      it '' do
        subject.fill_top_right(empty_h)
        expect(empty_h['0']).to eq({ '0'=>1, '1'=>2, '2'=>3, '3'=>4, '4'=>5 })
        expect(empty_h['1']).to eq({ '0'=>nil, '1'=>nil, '2'=>nil, '3'=>nil, '4'=>nil })
      end
    end

    describe '#fill_top_right again' do
      it 'increments up on the left' do
        top_hash = subject.fill_top_right(empty_h)
        top_right_hash = subject.fill_right_down(top_hash)
        bottom_hash = subject.fill_bottom_left(top_right_hash)
        left_hash = subject.fill_left_up(bottom_hash)
        final_hash = subject.fill_top_right(left_hash)
        expect(final_hash['0']).to eq({ '0'=>1, '1'=>2, '2'=>3 })
        expect(final_hash['1']).to eq({'0'=>8, '1'=>9, '2'=>4})
        expect(final_hash['2']).to eq({'0'=>7, '1'=>6, '2'=>5})
      end
    end
  end

  describe '#fill_right_down' do
    it 'increments down on the right' do
      top_hash = subject.fill_top_right(empty_h)
      top_right_hash = subject.fill_right_down(top_hash)
      expect(top_right_hash['0']).to eq({ '0'=>1, '1'=>2, '2'=>3 })
      expect(top_right_hash['1']).to eq({'0'=>nil, '1'=>nil, '2'=>4})
      expect(top_right_hash['2']).to eq({'0'=>nil, '1'=>nil, '2'=>5})
    end
  end

  describe '#fill_right_down' do
    it 'increments down on the right' do
      top_hash = subject.fill_top_right(empty_h)
      top_right_hash = subject.fill_right_down(top_hash)
      expect(top_right_hash['0']).to eq({ '0'=>1, '1'=>2, '2'=>3 })
      expect(top_right_hash['1']).to eq({'0'=>nil, '1'=>nil, '2'=>4})
      expect(top_right_hash['2']).to eq({'0'=>nil, '1'=>nil, '2'=>5})
    end
  end

  describe '#fill_bottom_left' do
    it 'increments left on the bottom' do
      top_hash = subject.fill_top_right(empty_h)
      top_right_hash = subject.fill_right_down(top_hash)
      bottom_hash = subject.fill_bottom_left(top_right_hash)
      expect(bottom_hash['0']).to eq({ '0'=>1, '1'=>2, '2'=>3 })
      expect(bottom_hash['1']).to eq({'0'=>nil, '1'=>nil, '2'=>4})
      expect(bottom_hash['2']).to eq({'0'=>7, '1'=>6, '2'=>5})
    end
  end

  describe '#fill_left_up' do
    it 'increments up on the left' do
      top_hash = subject.fill_top_right(empty_h)
      top_right_hash = subject.fill_right_down(top_hash)
      bottom_hash = subject.fill_bottom_left(top_right_hash)
      left_hash = subject.fill_left_up(bottom_hash)
      expect(left_hash['0']).to eq({ '0'=>1, '1'=>2, '2'=>3 })
      expect(left_hash['1']).to eq({'0'=>8, '1'=>nil, '2'=>4})
      expect(left_hash['2']).to eq({'0'=>7, '1'=>6, '2'=>5})
    end
  end

  describe '#convert_h_to_a' do
    it 'converts a hash to an array' do
      top_hash = subject.fill_top_right(empty_h)
      top_right_hash = subject.fill_right_down(top_hash)
      bottom_hash = subject.fill_bottom_left(top_right_hash)
      left_hash = subject.fill_left_up(bottom_hash)
      outer_arr = subject.convert_h_to_a(left_hash)
      expect(outer_arr[0]).to eq([1, 2, 3])
      expect(outer_arr[1]).to eq([8, nil, 4])
      expect(outer_arr[2]).to eq([7, 6, 5])
    end
  end

  describe '#process' do
    it 'defaults to a three by three hash' do
      result_arr = subject.process
      expect(result_arr).to eq([[1,2,3],[8,9,4],[7,6,5]])
    end

    describe '#process 4' do
      let(:subject) { CreateSpiral.new(4) }
      it '4x4' do
        result_arr = subject.process
        expect(result_arr).to eq([[1,2,3,4],[12,13,14,5],[11,16,15,6], [10,9,8,7]])
      end
    end
  end
end
