function move_across_field(r::Robot, s::HorizonSide)
    while isborder(r, Nord) == false
        if isborder(r, s) == false
            move!(r, s)
        else
            move!(r, Nord)
            s = inverse(s)
        end
    end
    while isborder(r,s) == false
        move!(r,s)
    end
end

function return_moves(r::Robot, side::HorizonSide)
    nun_sreps = 0
    while isborder(r, side) == false
        nun_sreps += 1
        move!(r, side)
    end
    return nun_sreps
end

function move_if_can(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r)
    end
end

function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    putmarker!(r)
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
next_clock(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))





