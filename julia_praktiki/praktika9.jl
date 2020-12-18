function find_marker(r)
    s :: HorizonSide = Nord
    n = 1
    while ismarker(r) == false #спиралевидное движение робота 
        do_steps_check_markers(r, s, n)
        s = next(s)
        do_steps_check_markers(r, s, n)
        s = next(s)
        n += 1
    end
end

function do_steps_check_markers(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        if ismarker(r) == true
            break
        end
        move!(r, side)
    end
end

next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))