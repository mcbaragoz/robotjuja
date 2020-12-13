function mark_field_borders!(r::Robot)
    a = []
    s::HorizonSide = Ost
    n = 0

    while (isborder(r, Sud) == false || isborder(r, Ost) == false) && (isborder(r, Sud) == false || isborder(r, West) == false)
        if isborder(r, s) == false
            n += 1
            move!(r, s)
        else
            push!(a, n)
            s = inverse(s)
            n = 0
            move!(r, Sud)
        end
    end
    while isborder(r, West) == false
        move!(r, West)
        n += 1
    end

    side::HorizonSide = Nord
    side1::HorizonSide = Ost

    while isborder(r, Nord) == false
        while putmarkers_borders!(r, side1) == true
            putmarkers_borders!(r, side1)
        end
        move!(r,Nord)
        putmarker!(r)
        side1 = inverse(side1)
    end

    putmarkers!(r, side1)

    move_if_can(r, inverse(side1))
    move_if_can(r, Sud)


    do_steps(r, Ost, n)


    m = reverse!(a)

    for i in 1:length(m)
        move!(r, Nord)
        for k ∈ 1:m[i]
            move!(r, s)
        end
        s = inverse(s)
    end

end

function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
    end
end

function putmarkers_borders!(r::Robot, side::HorizonSide)::Bool
    putmarker!(r)
    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
    end
    n = 0
    while isborder(r, side) == true
        if isborder(r, Nord) == false
            move!(r, Nord)
        else 
            break
        end
        n += 1
    end
    if isborder(r, side) == true
        for k ∈ 1:n
            move!(r, Sud)
        end
        return false
    else
        move!(r, side)
        while isborder(r, Sud) == true
            move!(r, side)
        end
        for i ∈ 1:n
            move!(r, Sud)
        end
        return true
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    putmarker!(r)
    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function move_if_can(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
next_clock(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))