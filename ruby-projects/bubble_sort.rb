def bubble_sort(array)
  sorted = true
  while sorted do
    sorted = false
    array.each.with_index do |number, index|
      unless array[index + 1] == nil
        if (array[index + 1] < array[index])
          sorted = true
          array[index], array[index + 1] = array[index + 1], array[index]
        end
      end
    end
  end
  return array
end

p bubble_sort([7,6,5,4,3,2,1])
# => [1,2,3,4,5,6,7]
p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]