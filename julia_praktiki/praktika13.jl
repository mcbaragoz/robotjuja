function bent_cross!(r::Robot)
    side1::HorizonSide = Nord
    side2::HorizonSide = West

    for i ∈ 1:4
        n = 0
        while isborder(r, side1) == false && isborder(r, side2) == false
            move!(r, side1)
            if isborder(r, side2) == false
                move!(r, side2)
                putmarker!(r)
                n += 1
            else 
                break
            end
        end
        for k ∈ 1:n
            move!(r, inverse(side1))
            move!(r, inverse(side2))
        end
        side1 = next(side1)
        side2 = next(side2)
    end
    putmarker!(r)
end

next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))


