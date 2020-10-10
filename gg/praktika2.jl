function mark_field(r::Robot)
    move1 = return_steps(r, Sud)
    move2 = return_steps(r, Ost)
    s::HorizonSide  = West

    while isborder(r, Nord) == false
        putmarkers!(r, s)
        move!(r,Nord)
        putmarker!(r)
        if s == West
            s = Ost
        else
            s = West
        end
    end

    
    
    while isborder(r, s) == false
        putmarkers!(r, s)
    end

    while isborder(r, Sud) == false
        move!(r, Sud)
    end

    while isborder(r, Ost) == false
        move!(r, Ost)
    end

    do_steps(r, Nord, move1)
    do_steps(r, West, move2)

end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side) == false
        putmarker!(r)
        move!(r, side)
    end
    putmarker!(r)
end

function return_steps(r::Robot, side::HorizonSide)
    nun_sreps = 0
    while isborder(r, side) == false
        nun_sreps += 1
        move!(r, side)
    end
    return nun_sreps
end

function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
    end
end