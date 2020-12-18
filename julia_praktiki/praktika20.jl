function num_horizontal_border(r::Robot) 
    while isborder(r, Sud) == false || isborder(r, West) == false
        move_if_can(r, Sud)
        move_if_can(r, West)
    end
    n = 0
    side::HorizonSide = Ost
    while ((isborder(r, Nord) == false) || (isborder(r, Ost) == false))
        while isborder(r, Nord) == false
            if isborder(r, side) == false
                move!(r, side)
            else 
                break
            end
        end
        if (isborder(r, Nord) == true)
            while isborder(r, Nord) == true
                if (isborder(r, side) == false)
                    move!(r, side)
                else
                    break
                end
            end
            n += 1
        else
            if (isborder(r, side) == true)
                move!(r, Nord)
                side = inverse(side)
            end
        end
    end
    if (side == Ost) && (n != 0)
        n -= 1
    end
    return(n)
end


function move_if_can(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))