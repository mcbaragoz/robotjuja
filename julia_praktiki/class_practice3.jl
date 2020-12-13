function num_borders(r::Robot,side::HorizonSide)
# state = false # по условию у границы перегородки сверху быть не может
# num=0
# #ИНВАРИАНТ: num = число ранее (по ходу движения) обнаруженных перегородок
# while move!(r,side)==false
#     move!(r,side)
#     if state==false 
#         if isborder(r,Nord)==true
#             num += 1
#             state = true
#         end
#     end
# end
# #УТВ: Робот - в конце ряда (следовательно, больше в этом ряду необнаруженных перегородок нет)
# return num
# end

# function num_borders(r::Robot,side::HorizonSide)
#     num=0
#     while isborder(r,side)==false
#         if попытка_пройти_промежуток(r,side) == true
#             #УТВ: Робот в начале очередной перегородки 
#             num += 1
#             пройти_мимо_перегородки(r,side)
#         end
#     end
#     return num
# end

# function попытка_пройти_промежуток(r::Robot,side::HorizonSide) 
#     while isborder(r,Nord)==false 
#         if isborder(r,side) == true
#             return false
#         end
#         move!(r,side)
#     end
#     return true
# end

# пройти_мимо_перегородки(r::Robot,side::HorizonSide) = while isborder(r,Nord)==true move!(r,side) end

    n = 0 
    while isborder(r, side) == false
        if isborder(r, Nord) == false
            while isborder(r, Nord) == false
                move!(r, side)
            end
        else
            n += 1
            while isborder(r, Nord)  == true
                if isborder(r, side) == true
                    break
                end
                move!(r, side)
            end
        end
    end
    return (n)
end
