function ugli_polya!(r::Robot)
    a = []
    s::HorizonSide = Ost
    n = 0
    #опускаемся в левыый или правый нижний угол
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
    while isborder(r, West) == false #юго-западный угол
        move!(r, West)
        n += 1 
    end

    side::HorizonSide = Nord

    for _ in 1:4
        while isborder(r, side) == false
            move!(r, side)
        end
        putmarker!(r)
        side = next_clock(side)
    end
    
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

function putmarkers!(r::Robot, side::HorizonSide)
    putmarker!(r)
    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
next_clock(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))