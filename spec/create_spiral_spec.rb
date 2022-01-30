require 'spec_helper'
require 'create_spiral'
RSpec.describe CreateSpiral do
  let(:subject) { CreateSpiral.new }

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
    let(:empty_h) { subject.create_empty_hash }
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
  end


end
