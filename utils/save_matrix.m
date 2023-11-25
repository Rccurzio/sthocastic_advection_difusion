function [] = save_matrix(matrix, number_of_points, method, dimension, is_stochastic)
    s = "";
    if is_stochastic
        s = "s";
    end

    if dimension == 1
        dim = "1D/";
    else
        dim = "2D/";
    end

    filename = "exports/" + dim + s + num2str(number_of_points) + "_" + method + ".csv";
    writematrix(matrix, filename)
end