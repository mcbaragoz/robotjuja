function find_passage(r)
    s::HorizonSide = Ost
    n = 1
    while isborder(r, Nord) == true
        do_steps(r, s, n)
        n +=1
        s = inverse(s)
    end
end
function do_steps(r::Robot, side::HorizonSide, nun_sreps::Int64)
    for i in 1:nun_sreps
        move!(r, side)
    end
end
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))