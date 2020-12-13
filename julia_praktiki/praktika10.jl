function average_temp(r)
    s::HorizonSide = Ost
    temp = 0
    n = 0
    while isborder(r, Nord) == false
        if ismarker(r) == true 
            temp += temperature(r)
            n += 1
        end
        if isborder(r, s) == false
            move!(r, s)
        else
            move!(r, Nord)
            s = inverse(s)
        end
    end
    while isborder(r,s) == false
        if ismarker(r) == true 
            temp += temperature(r)
            n += 1
        end
        move!(r,s)
    end
    if ismarker(r) == true 
        temp += temperature(r)
        n += 1
    end
    av = temp / n
    print(av)

end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
function temp_of_marker(r, temp, n)
    if ismarker(r) == true 
        temp += temperature(r)
        n += 1
    end
end




