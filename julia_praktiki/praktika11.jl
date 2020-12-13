function four_markers!(r::Robot)
    side::HorizonSide = Nord
    num_steps = 0
    for side in (Nord, West, Sud, Ost)
        num_steps = return_moves_borders(r,side)
        putmarker!(r)
        movements!(r, inverse(side), num_steps)
    end
end

function return_moves_borders(r::Robot, side::HorizonSide)
    nun_sreps = 0
    while move_if_possible_borders!(r, side) == true
        nun_sreps += 1
    end
    return nun_sreps
end


function move_if_possible_borders!(r::Robot, side::HorizonSide)::Bool
    side1 = next(side)
    side2 = next_clock(side)
    n = 0
    while isborder(r, side) == true
        if isborder(r, side1) == false
            move!(r, side1)
            n += 1
        else
            break
        end
    end

    if isborder(r, side) == false
        move!(r, side)
        while isborder(r, side2) == true
            move!(r, side)
        end
        result = true
    else
        result = false
    end
    for _ in 1:n
        move!(r, side2)
    end
    return(result)
end

function movements!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move_if_possible_borders!(r,side) # - в данном случае возможность обхода внутренней перегородки гарантирована
    end
end

next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
next_clock(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))