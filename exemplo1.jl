using JuMP, Cbc
modelo=Model(with_optimizer(Cbc.Optimizer))
@variable(modelo, x1>=0)
@variable(modelo, 1<=x2<=20)
@objective(modelo, Max, x1+x2)
@constraint(modelo, 2*x1+x2<=8)
optimize!(modelo)
print(modelo)
