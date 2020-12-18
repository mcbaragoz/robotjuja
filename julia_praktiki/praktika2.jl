function mark_frame!(r::Robot)
    move1 = return_moves(r, Sud) #перемещаем робота в юго-восточный угол, 
    move2 = return_moves(r, Ost) #запоминаем количество сделанных шагов

    for side in (HorizonSide(i) for i=0:3)
        putmarkers!(r, side)
    end

    do_steps(r, Nord, move1)
    do_steps(r, West, move2)
end

function return_moves(r::Robot, side::HorizonSide)
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

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
    end
end








    




