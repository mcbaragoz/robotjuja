function rectangular_num(r::Robot) 
    while isborder(r, Sud) == false || isborder(r, West) == false
        move_if_can(r, Sud)
        move_if_can(r, West)
    end
    l = 0
    side::HorizonSide = Ost
    while ((isborder(r, Nord) == false) || (isborder(r, Ost) == false))
        if isborder(r, side) == false
            move!(r, side)
        else
            n = 0
            next_lvl = false
            while isborder(r, side) == true
                if isborder(r, Nord) == false
                    move!(r, Nord)
                    n += 1
                else
                    next_lvl = true
                    break
                end
            end
            putmarker!(r)
            if isborder(r, side) == false
                move!(r, side)
            end
            if isborder(r, Sud) == false
                do_steps(r, Sud, n)
                if next_lvl == true
                    move!(r, Nord)
                    side = inverse(side)
                end
            else
                while isborder(r, Sud) == true
                    move!(r, side)
                end
                if ismarker(r) == false
                    l += 1
                end
                putmarker!(r)
                do_steps(r, Sud, n)
            end
        end
    end
    return (l)
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))

function move_if_can(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
    end
end

function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
    end
end
