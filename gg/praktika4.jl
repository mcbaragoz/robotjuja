function ugli_polya!(r::Robot)
    #putmarker!(r)
    #while isborder(r, Sud) == false || isborder(r, Ost) == false
    #   if isborder(r, Sud) == false
    #        move!(r, Sud)
    #    else
    #        move!(r, Ost)
    #    end
    #end
    m = []
    s::HorizonSide = West
    
    while isborder(r, Sud) == false
        push!(m, return_moves(r, s))
        move!(r, Sud)
        if s == West
            s = Ost
        else
            s = West
        end      
    end

    while isborder(r, Ost) == false
        a = return_moves(r, s)
        push!(m, a)
    end

    putmarker!(r)

    for side in (Nord,West,Sud,Ost)
        while isborder(r, side) == false
            move!(r, side)
        end
        if isborder(r, side) == true
            putmarker!(r)
        end
    end
     
    # if s == West
     #   s = Ost
    #else
    #    s = West
    #end  

    print(m)
    n = length(m)
    print(n)
    print(s)
    
    for i in reverse!(m)
        if s == West
            s = Ost
        else
            s = West
        end  
        do_steps(r, s, i)
        move!(r, Nord)
    end
    move!(r, Sud)

end
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
