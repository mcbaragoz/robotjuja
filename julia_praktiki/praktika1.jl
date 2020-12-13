function cross!(r::Robot)
    s::HorizonSide = Nord
    for i ∈ 1:4
        putmarkers!(r, s)
        move_by_markers!(r, inverse(s))
        s = next(s)
    end
    putmarker!(r)
end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function move_by_markers!(r :: Robot, side:: HorizonSide)
    while ismarker(r) == true 
        move!(r, side)
    end
end

next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))