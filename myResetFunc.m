function in = myResetFunc(in)

new_sim_case = randi([2 6], 1, 1);

in = in.setVariable('sim_case', new_sim_case, 'Workspace', 'HESS');

end

