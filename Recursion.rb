
def fibs(n, arr = [])
	a, b = 0, 1
	until arr.length == n
		arr << a 
		a, b = b, b + a 
	end 
end

def fibs_rec(n, arr = [0,1])
	if n <= 2
		return arr
	else 
		arr << arr[-1] + arr[-2]
		fibs_rec(n-1,arr)
	end
end

def merge_sort(arr)
	if arr.length != 1
		arr_a = arr[0..((arr.length/2)-1)]
		arr_b = arr[(arr.length/2)..-1]
	else
		return arr
	end
	# base case:

	if arr_a.length == 1 && arr_b.length == 1
		if arr_a[0] < arr_b[0]
			return [arr_a[0],arr_b[0]]
		else
			return [arr_b[0],arr_a[0]]
		end
	end
	# end of base case.

	# now the arrays being compared are sorted.
	arr_accumulator = []
	first_index = 0
	second_index = 0
	until merge_sort(arr_a)[first_index] == nil && merge_sort(arr_b)[second_index] == nil
		# check for nil cases:
		if merge_sort(arr_a)[first_index] == nil
			arr_accumulator << merge_sort(arr_b)[second_index]
			second_index += 1
		elsif merge_sort(arr_b)[second_index] == nil
			arr_accumulator << merge_sort(arr_a)[first_index]
			first_index += 1 
		else #stop checking for nil cases.
			if merge_sort(arr_a)[first_index] < merge_sort(arr_b)[second_index]
				arr_accumulator << merge_sort(arr_a)[first_index]
				first_index += 1
			else
				arr_accumulator << merge_sort(arr_b)[second_index]
				second_index += 1
			end
		end
	end
	return arr_accumulator

end

p 	merge_sort([109,20,1,2,3,56,69,90,7])