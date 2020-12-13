#Cодержимое файла roblib.jl

"""
    movements!(r::Robot, side::HorizonSide, num_steps::Int)

-- Перемещает Робота в заданном направлении на заданное число шагов    
"""
movements!(r::Robot, side::HorizonSide, num_steps::Int) = for _ in 1:num_steps move!(r,side) end

"""
    movements!(r::Robot, side::HorizonSide)

-- Перемещает Робота в заданном направлении до упора    
"""
movements!(r::Robot, side::HorizonSide) = while isborder(r,side)==false move!(r,side) end 


"""
    get_num_movements!(r::Robot, side::HorizonSide)

-- Перемещает Робота в заданном направлении до упора и возвращает сделанное число шагов    
"""
function get_num_movements!(r::Robot, side::HorizonSide)
    num_steps = 0
    while isborder(r,side)==false 
        move!(r,side) 
        num_steps += 1    
    end
    return num_steps
end

"""
    inverse(side::HorizonSide)

-- Возвращает направление, противоположное заданному    
"""
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

"""
    left(side::HorizonSide)

-- Возвращает направление, следующее, если отсчитывать против часовой стредки, по отношению к заданному    
"""
left(side::HorizonSide) =  HorizonSide(mod(Int(side)+1, 4))
# - прежде было имя next, но все-таки будет существенно удобнее, если его заменить на  lef (это будет яснее)

"""
    right(side::HorizonSide)

-- Возвращает направление, предыдущее, если отсчитывать против часовой стредки, по отношению к заданному    
"""
right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))