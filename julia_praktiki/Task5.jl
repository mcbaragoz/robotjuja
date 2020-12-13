function make_mark!(r::Robot)
    num_steps = go_to_Left_Down_corner(r)
    mark_corners!(r)
    go_to_start_position!(r, num_steps)    
end

function go_to_Left_Down_corner(r::Robot)
    num_steps = []
    while isborder(r, Sud) || isborder(r,West) != true
        steps_sud = 0
        steps_ost = 0
        while isborder(r, Sud)!= true
            move!(r,Sud)
            steps_sud += 1
        end
        push!(num_steps, steps_sud)
        while isborder(r, Ost)!= true
            move!(r,Ost)
            steps_ost += 1
        end
        push!(num_steps, steps_ost)
    end
    return num_steps
end

function mark_corners!(r::Robot)
    for i ∈ 0:3
        putmarker!(r)
        while isborder(r,HorizonSide[i]) != true
            move!(r,HorizonSide[i])
        end
    end
end

function go_to_start_position!(r::Robot, num_steps)
    for i ∈ 1:length(num_steps)
        d = length(num_steps) + 1 - i
        if isodd(d) == true
            for j ∈ 1:num_steps[d]
                move!(r, Nord)
            end
        else
            for j ∈ 1:num_steps[d]
                move!(r, West)
            end 
        end
    end
end