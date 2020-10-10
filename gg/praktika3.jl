function mark_stairway(r::Robot)
    move1 = return_steps(r, Sud)
    move2 = return_steps(r, Ost)
    s::HorizonSide = Ost
    n = 0
    
    while isborder(r, West) == false
        n += 1
        putmarker!(r)
        move!(r, West)

    end

    putmarker!(r)
    
    

    l = 0
    while isborder(r, Nord) == false
        move!(r, Nord)
        if s == Ost
            k = n - l 
            for i in 1:k
                putmarker!(r)
                move!(r, s)
            end
            for i in 1:l
                move!(r, s)
            end
            l += 1
            s = West
        elseif s == West
            k = n - l
            for i in 1:l 
                move!(r, s)
            end
            for i in 1:k
                
                move!(r, s)
                putmarker!(r)
            
            end
            l += 1
            s = Ost
        end
    end
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