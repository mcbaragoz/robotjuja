function cross_and_borders!(r::Robot)
    s::HorizonSide = Nord
    op_s::HorizonSide = Sud
    # log::Bool = true
    for i ∈ 1:4
        putmarkers_borders14!(r, s)
        while putmarkers_borders14_marker!(r, s) == true
            putmarkers_borders14_marker!(r, s)
        end
        move_by_markers_borders(r, op_s)
        s = next(s)
        op_s = next(op_s)
    end
end
        
        


function putmarkers_borders14!(r::Robot, side::HorizonSide)
    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
    end
    n = 0
    side1 = next(side)
    while isborder(r, side) == true
        if isborder(r, side1) == false
            move!(r, side1)
        else 
            break
        end
        n += 1
    end
    side2 = inverse(side1)
    if isborder(r, side) == true
        for k ∈ 1:n
            move!(r, side2)
        end
        return false
    else
        move!(r, side)
        while isborder(r, side2) == true
            move!(r, side)
        end
        for i ∈ 1:n
            move!(r, side2)
        end
        return true
    end
end

function putmarkers_borders14_marker!(r::Robot, side::HorizonSide)
    putmarker!(r)
    while isborder(r,side) == false
        move!(r, side)
        putmarker!(r)
    end
    n = 0
    side1 = next(side)
    while isborder(r, side) == true
        if isborder(r, side1) == false
            move!(r, side1)
        else 
            break
        end
        n += 1
    end
    side2 = inverse(side1)
    if isborder(r, side) == true
        for k ∈ 1:n
            move!(r, side2)
        end
        return false
    else
        move!(r, side)
        while isborder(r, side2) == true
            move!(r, side)
        end
        for i ∈ 1:n
            move!(r, side2)
        end
        return true
    end
end


# function putmarkers_borders14!(r::Robot, side::HorizonSide, l::Bool)::Bool
#     while isborder(r,side) == false
#         move!(r, side)
#         putmarker!(r)
#     end
#     n = 0
#     side1 = next(side)
#     while isborder(r, side) == true
#         if isborder(r, side1) == false
#             move!(r, side1)
#         else 
#             break
#         end
#         n += 1
#     end
#     side2 = inverse(side1)
#     if isborder(r, side) == true
#         for k ∈ 1:n
#             move!(r, side2)
#         end
#         l = false
#     else
#         move!(r, side)
#         while isborder(r, side2) == true
#             move!(r, side)
#         end
#         for i ∈ 1:n
#             move!(r, side2)
#         end
#         l = true
#     end
#     return(l)
# end

function move_by_markers_borders(r::Robot, side::HorizonSide)
    while ismarker(r) == true
        if isborder(r, side) == false
            move!(r, side)
        else
            side1 = next_clock(side)
            n = 0
            while isborder(r, side) == true
                move!(r, side1)
                n += 1
            end
            move!(r, side)
            side2 = next(side)
            while isborder(r, side2) == true
                move!(r, side)
            end
            for i ∈ 1:n
                move!(r, side2)
            end
        end
    end
end


next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
next_clock(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))