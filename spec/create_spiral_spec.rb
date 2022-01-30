require 'spec_helper'
require 'create_spiral'
RSpec.describe CreateSpiral do
  describe 'initialization' do
    let(:subject) { CreateSpiral.new }
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

    describe '#' do

    end
  end

  describe '' do

  end
end
