class OperationalTransformation
  attr_reader :words


  def initialize(words)
    @words = words
  end

  def insert_insert(position_1, insert_1, client_1, position_2, insert_2, client_2)

    if position_1 < position_2
      insert_apply(position_2, insert_2)
      insert_apply(position_1, insert_1)
    elsif position_1 == position_2
      insert_apply(position_2, insert_2)
      insert_apply(position_1, insert_1)
    else
      position_1 += insert_2.length

      insert_apply(position_2, insert_2)
      insert_apply(position_1, insert_1)
    end
  end

  def insert_delete(position_1, insert, client_1, position_2, delete_length, client_2)

    if position_1 < position_2
      delete_apply(position_2, delete_length)
      insert_apply(position_1, insert)
    elsif position_1 == position_2
      delete_apply(position_2, delete_length)
      insert_apply(position_1, insert)
    else
      position_1 -= delete_length

      delete_apply(position_2, delete_length)
      insert_apply(position_1, insert)
    end
  end

  def delete_insert(position_1, delete_length, client_1, position_2, insert, client_2)
    if position_1 > position_2
      delete_apply(position_1, delete_length)
      insert_apply(position_2, insert)
    elsif position_1 == position_2
      delete_apply(position_1, delete_length)
      insert_apply(position_2, insert)
    else
      position_2 -= delete_length

      delete_apply(position_1, delete_length)
      insert_apply(position_2, insert)
    end
  end

  def delete_delete(position_1, delete_length_1, client_1, position_2, delete_length_2, client_2)
    if position_1 < position_2
      delete_apply(position_2, delete_length_2)
      delete_apply(position_1, delete_length_1)
    elsif position_1 == position_2
      delete_apply(position_2, [delete_length_1, delete_length_2].max)
    else
      check_continuous = continuous?(delete_range(position_1, delete_length_1), delete_range(position_2, delete_length_2))

      if check_continuous
        delete_apply(position_2, check_continuous)
      else
        position_1 -= delete_length_2
        delete_apply(position_2, delete_length_2)
        delete_apply(position_1, delete_length_1)
      end
    end
  end

  def continuous?(range_1, range_2)
    arr = [range_1, range_2].flatten.sort.uniq
    tracker = arr[0]

    flag = true

    arr.each do |e|
      if e != tracker
        flag = false
      end
      tracker += 1
    end

    if flag
      arr.length
    else
      nil
    end
  end

  def delete_range(start_index, num_of_indexes)
    end_index = (start_index + num_of_indexes) - 1
    (start_index..end_index).to_a
  end

  def insert_apply(position, insert)
    @words.insert(position, insert)
  end

  def delete_apply(position, delete_length)
    # require "pry"; binding.pry
    @words.slice!(position, delete_length)
  end
end



# def set?(range_1, range_2)
#   (range_1.first <= range_2.last) && (range_2.first <= range_1.last)
# end


# if set?(delete_range(position_1, delete_length_1), delete_range(position_2, delete_length_2))
#   combined_range
