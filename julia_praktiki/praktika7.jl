function chess!(r::Robot)
    move1 = return_steps(r, Sud)
    move2 = return_steps(r, West)
    chess_raw!(r, Ost)
    s::HorizonSide = West
    while isborder(r, s) == false
        if ismarker(r) == false 
            move!(r, Nord)
            chess_raw!(r, s)
        else
            move!(r,Nord)
            move!(r, s)
            chess_raw!(r, s)
        end
        if s == West
            s = Ost
        else
            s = West
        end
        if isborder(r, Nord) == true
            break
        end
    end

    while isborder(r, Sud) == false
        move!(r,Sud)
    end 

    while isborder(r, West) == false
        move!(r, West)
    end 

    do_steps(r, Nord, move1)
    do_steps(r, Ost, move2)
    putmarker!(r)
end

function chess_raw!(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        putmarker!(r)
        if isborder(r, side) == false
            move!(r, side)
        else
            break
        end
        if isborder(r, side) == false
            move!(r, side)
        else
            break
        end
    end
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