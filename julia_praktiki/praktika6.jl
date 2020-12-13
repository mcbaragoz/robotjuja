function mark_innerrectangle_perimetr!(r::Robot)
    move1 = return_moves(r, Sud)
    move2 = return_moves(r, West)
    move3 = return_moves(r, Sud)

    direction_of_movement::HorizonSide = Nord

    while isborder(r, Ost) == false
        if isborder(r, direction_of_movement) == false
            move!(r, direction_of_movement)
        else
            move!(r, Ost)
            direction_of_movement = inverse(direction_of_movement)
        end
    end

    s::HorizonSide = Nord
    border_direction::HorizonSide = Ost

    for i ∈ 1:5
        putmarker!(r)
        while isborder(r, border_direction) == true
            move!(r,s)
            putmarker!(r)
        end
        move!(r, border_direction)
        s = next_clock(s)
        border_direction = next_clock(border_direction)
    end 

    comeback(r, West)


    do_steps(r, Nord, move3)
    do_steps(r, Ost, move2)
    do_steps(r, Nord, move1)
end

    
#     direction_of_movement= (Nord,Ost,Sud, West)
#     border_direction=(Ost,Sud,West,Nord)

#     for i ∈ 1:4
#         putmarkers!(r, direction_of_movement[i], border_direction[i])
#     end
# end




    
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))

function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
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
function comeback(r::Robot, side1::HorizonSide)
    while isborder(r, side1) == false
        move!(r, side1)
    end
    while isborder(r, next(side1)) == false
        move!(r, next(side1))
    end
end
    

next_clock(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))
next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))

# function putmarkers!(r::Robot, direction_of_movement::HorizonSide, border_direction::HorizonSide)
#     while isborder(r,border_direction)==true
#         putmarker!(r)
#         move!(r,direction_of_movement)
#     end
# end



    