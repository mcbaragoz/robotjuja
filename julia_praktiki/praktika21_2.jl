function num_hor_ver_borders2(r::Robot) 
    while isborder(r, Sud) == false || isborder(r, West) == false
        move_if_can(r, Sud)
        move_if_can(r, West)
    end
    n = 0
    side::HorizonSide = Ost
    hor = 0
    ver = 0
    n += num_borderss(r, Nord, Ost, side, hor)
    side = Sud
    n += num_borderss(r, West, Nord, side, ver)
    return (n-2)
end
   

function num_borderss(r::Robot, side1::HorizonSide, side2::HorizonSide, side::HorizonSide, n::Int64)
    while ((isborder(r, side1) == false) || (isborder(r, side2) == false))
        if isborder(r, side) == false
            move!(r, side)
            if isborder(r, side1) == true
                while isborder(r, side1) == true
                    if isborder(r, side) == false
                        move!(r, side)
                    else
                        break
                    end
                end
                n += 1
            end
        else
            n_border = false
            k = 0
            while isborder(r, side) == true
                
                if isborder(r, side1) == false
                    move!(r, side1)
                    k += 1
                else
                    n_border = true
                    ##do_steps(r, Sud, n)
                    ##move!(r, Nord)
                    ##side = inverse(side)
                    break
                end
                
            end
            if n_border == false
                move!(r, side)
                do_steps(r, inverse(side1), k)
            else
                do_steps(r, inverse(side1), k)
                side = inverse(side)
                move!(r, side1)
            end
            
        end
    end
    return (n)
end
function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
    end
end

function move_if_can(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
    end
end
    
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))