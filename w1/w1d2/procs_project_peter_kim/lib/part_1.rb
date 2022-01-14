def my_map(array, &prc)
    new_array = []
    array.each { |el| new_array << prc.call(el) }
    new_array
end 

def my_select(arr, &prc)
    new_arr = []
    arr.each { |el| new_arr << el if prc.call(el) }
    new_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count
end

def my_any?(arr, &prc)
    arr.each { |el| return true if prc.call(el) }
    return false
end

def my_all?(arr, &prc)
    arr.each { |el| return false if !prc.call(el) }
    return true
end

def my_none?(arr, &prc)
    arr.each { |el| return false if prc.call(el) }
    return true
end