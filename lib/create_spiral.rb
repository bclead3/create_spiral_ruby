# frozen_string_literal: true

# require 'byebug'

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
      # pp working_h
      fill_right_down(working_h)
      # pp working_h
      fill_bottom_left(working_h)
      # pp working_h
      fill_left_up(working_h)
      # pp working_h
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
    (@x_base..@x_ceiling).each do |x_incr|
      next unless work_h[@y_base.to_s][x_incr.to_s].nil?

      num_val += 1
      work_h[@y_base.to_s][x_incr.to_s] = num_val
      @is_clocking = false if num_val == @max_increment * @max_increment
    end
    @y_base += 1
    work_h
  end

  def fill_right_down(work_h)
    num_val = work_h[(@y_base - 1).to_s][@x_ceiling.to_s]
    (@y_base..@y_ceiling).each do |y_incr|
      next unless work_h[y_incr.to_s][@x_ceiling.to_s].nil?

      num_val += 1
      work_h[y_incr.to_s][@x_ceiling.to_s] = num_val
      @is_clocking = false if num_val == @max_increment * @max_increment
    end
    @x_ceiling -= 1
    work_h
  end

  def fill_bottom_left(work_h)
    num_val = work_h[@y_ceiling.to_s][(@x_ceiling + 1).to_s]
    @x_ceiling.downto(@x_base) do |x_incr|
      next unless work_h[@y_ceiling.to_s][x_incr.to_s].nil?

      num_val += 1
      work_h[@y_ceiling.to_s][x_incr.to_s] = num_val
      @is_clocking = false if num_val == @max_increment * @max_increment
    end
    @y_ceiling -= 1
    work_h
  end

  def fill_left_up(work_h)
    num_val = work_h[(@y_ceiling + 1).to_s][@x_base.to_s]
    @y_ceiling.downto(@y_base) do |y_decr|
      next unless work_h[y_decr.to_s][@x_base.to_s].nil?

      num_val += 1
      work_h[y_decr.to_s][@x_base.to_s] = num_val
      @is_clocking = false if num_val == @max_increment * @max_increment
    end
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
end
