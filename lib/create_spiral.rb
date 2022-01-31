# frozen_string_literal: true

require 'byebug'

class CreateSpiral
  attr_reader :max_increment, :x_ceiling, :x_base, :y_ceiling, :y_base, :is_clocking

  def initialize(incr = 3)
    @max_increment = incr.to_i
    @x_ceiling = incr.to_i - 1
    @x_base = 0
    @y_ceiling = incr.to_i - 1
    @y_base = 0
    @is_clocking = true
  end

  def process
    return [] if @max_increment.nil? || @max_increment < 3

    working_h = create_empty_hash
    while @is_clocking
      fill_top_right(working_h)
      fill_right_down(working_h)
      fill_bottom_left(working_h)
      fill_left_up(working_h)
    end
    convert_h_to_a(working_h)
  end

  def create_empty_hash
    ret_h = {}
    (0..@y_ceiling).each do |row_increment|
      ret_h[row_increment.to_s] = {}
      (0..@x_ceiling).each do |col_increment|
        ret_h[row_increment.to_s][col_increment.to_s] = nil
      end
    end
    ret_h
  end

  def fill_top_right(work_h)
    num_val = work_h[@y_base.to_s][(@x_base - 1).to_s] || 0
    looper(work_h, @x_base, @x_ceiling, num_val, 'y')
    @y_base += 1
    work_h
  end

  def fill_right_down(work_h)
    num_val = work_h[(@y_base - 1).to_s][@x_ceiling.to_s]
    looper(work_h, @y_base, @y_ceiling, num_val, 'x')
    @x_ceiling -= 1
    work_h
  end

  def looper(work_h, low, high, num_val, keep_x_y)
    sub_looper(work_h, low, high, num_val, keep_x_y)
    work_h
  end

  def fill_bottom_left(work_h)
    num_val = work_h[@y_ceiling.to_s][(@x_ceiling + 1).to_s]
    decrament_looper(work_h, @x_base, @x_ceiling, num_val, 'y')
    @y_ceiling -= 1
    work_h
  end

  def fill_left_up(work_h)
    num_val = work_h[(@y_ceiling + 1).to_s][@x_base.to_s]
    decrament_looper(work_h, @y_base, @y_ceiling, num_val, 'x')
    @x_base += 1
    work_h
  end

  def convert_h_to_a(hash)
    ret_arr = []
    hash.each do |_k, v|
      arr = []
      v.each do |_sub_k, sub_v|
        arr << sub_v
      end
      ret_arr << arr
    end
    ret_arr
  end

  private

  def sub_looper(work_h, low, high, num_val, keep_x_y)
    (low..high).each do |incr|
      num_val = process_x(work_h, incr, num_val) if keep_x_y == 'x'
      num_val = process_y(work_h, incr, num_val) if keep_x_y == 'y'
      @is_clocking = false if num_val == @max_increment * @max_increment
    end
  end

  def process_x(work_h, incr, num_val)
    return if work_h[incr.to_s][@x_ceiling.to_s]

    num_val += 1
    work_h[incr.to_s][@x_ceiling.to_s] = num_val
  end

  def process_y(work_h, incr, num_val)
    return if work_h[@y_base.to_s][incr.to_s]

    num_val += 1
    work_h[@y_base.to_s][incr.to_s] = num_val
  end

  def decrament_looper(work_h, low, high, num_val, keep_x_y)
    high.downto(low) do |decr|
      num_val = process_decr_x(work_h, decr, num_val) if keep_x_y == 'x'
      num_val = process_decr_y(work_h, decr, num_val) if keep_x_y == 'y'
      @is_clocking = false if num_val == @max_increment * @max_increment
    end
  end

  def process_decr_x(work_h, decr, num_val)
    return if work_h[decr.to_s][@x_base.to_s]

    num_val += 1
    work_h[decr.to_s][@x_base.to_s] = num_val
  end

  def process_decr_y(work_h, decr, num_val)
    return if work_h[@y_ceiling.to_s][decr.to_s]

    num_val += 1
    work_h[@y_ceiling.to_s][decr.to_s] = num_val
  end
end
