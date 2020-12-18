function find_marker_borders(r::Robot)
    side::HorizonSide = Nord
    n = 1
    while ismarker(r) == false
        for i in 1:2
            do_steps_check_markers(r, side, n)
            side = next(side)
        end
        n += 1
    end
end



function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
    end
end

#spiral_move(r::Robot)

function meet_border(r::Robot, side::HorizonSide)
    n = 1
    s = next(side)
    while isborder(r, side) == true
        do_steps(r, s, n)
        n +=1
        s = inverse(s)
    end
    move!(r, side)
    if (n % 2 == 1)
        n = div(n, 2)
    else
        n = div(n, 2)
    end 

    do_steps(r, s, n)
    
end

function do_steps_check_markers(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        if (ismarker(r) == true)
            break
        elseif (isborder(r, side) == true)
            meet_border(r, side)
            continue
        end
        move!(r, side)
    end
end

next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))