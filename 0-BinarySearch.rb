def binary_search(a, e)
    from = 0
    to = a.count
    result = nil
    while from <= to
        mid = (from + to) / 2
        if e <= a[mid]
            result = mid
            to = mid - 1
        else
            from = mid + 1
        end
    end
    result
end
