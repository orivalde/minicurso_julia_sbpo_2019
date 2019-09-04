using JuMP, Cbc
modelo=Model(with_optimizer(Cbc.Optimizer))
@variables modelo begin
    0<=x1<=10
    x2>=0
    x3>=0
end
@objective(modelo, Max, x1+2x2+5x3)
@constraints modelo begin
    -x1+x2+3x3<=-5
    x1+3x2-7x3<=10
end
print(modelo)
optimize!(modelo)
println("Função objetivo: ", objective_value(modelo))
println("x1=", value(x1))
println("x2=", value(x2))
println("x3=", value(x3))
