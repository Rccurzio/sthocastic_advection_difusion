function data = inputs
    %% Parâmetros de simulação
    data.spacial_dimensions = 1;
    data.method = 'explicit';
    % data.number_of_points_array = [100, 200, 400, 800, 1600];
    data.number_of_points_array = [100];
    
    %% Parâmetros do problema
    data.total_distance = 1;
    data.total_time = 0.5; 
    data.diffusion_coef = 2.11E-5;

    %% Campos de velocidades
    data.permanent_wind_velocity_x = 1;
    data.permanent_wind_velocity_y = 3;

    if data.spacial_dimensions == 1
        wind_field_function_x = @(x, y, t) 1;
        wind_field_function_y = @(x, y, t) 1;
    else
        wind_field_function_x = @(x, y, t) sin((y^3))^2;
        wind_field_function_y = @(x, y, t) cos(sqrt(x))^2;
    end

    data.wind_field_x = @(x, y, t, noise) data.permanent_wind_velocity_x*wind_field_function_x(x, y, t) + noise;
    data.wind_field_y = @(x, y, t, noise) data.permanent_wind_velocity_y*wind_field_function_y(x, y, t) + noise;

    %% Parâmetros de estabilidade
    data.peclet = 20;
    data.courant = 0.5;
    data.fourier = data.courant/data.peclet;

    %% Condições iniciais de concentração
    data.C_t1 = 0;
    data.C_x1 = 1;
    data.C_y1 = data.C_x1;

    %% Localização da fonte
    data.source_x = 0.5;
    data.source_y = data.source_x;

    %% Parâmetro estocástico
    data.is_stochastic = false;
    data.normal_distribution = makedist('Normal');
    data.stochastic_relevance = 1E-2;

    %% Parâmetro de radioatividade
    data.activity_concentration = 2.334E+07; % Bq/m^3
    data.dose_coefficient = 6.7E-06/3600; % mSv*m^3/Bq/s
    data.annual_exposure  = 3; % mSv
end