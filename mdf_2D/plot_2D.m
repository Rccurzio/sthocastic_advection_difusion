function [] = plot_2D(data_inputs, mp, concentration_per_volume, effective_dose)
    d = data_inputs;
    max_dose = max(effective_dose, [], 'all');

    MIN_DOSE_THRESHOLD = 1E-1;
    MIN_CONCENTRATION_THRESHOLD = 1E-2;

    figure('units','normalized','outerposition',[0 0 1 1])
    for t = 1:mp.t_number_of_points
        tcl = tiledlayout(1,2);
        title(tcl,"Tempo de Simulação: " + num2str(mp.delta_t*t, 4) + " s")

        % h = contourf(mp.x_grid, mp.y_grid, concentration_per_volume(:,:,t), 25);
        nexttile
        surf(mp.x_grid, mp.y_grid, concentration_per_volume(:,:,t));
        
        set(gca,'ColorScale','log');
        shading interp

        view(2);
        % zlim([0,d.C_x1]);
        xlim([0,d.total_distance]);
        ylim([0,d.total_distance]);

        xlabel('Distância (m)'); 
        ylabel('Distância (m)'); 
        zlabel('Concentração (Bq/m³)');

        title("Concentração (Bq/m³)");
    
        colormap(custom_gray)
        cl = colorbar;

        concentration_ticks = colorbar_ticks(MIN_CONCENTRATION_THRESHOLD, d.C_x1);
        cl.Ticks = concentration_ticks;
        cl.TickLabels = num2cell(concentration_ticks);

        clim([1E-2 d.C_x1]);

        %% Dose Acumulada

        nexttile
        surf(mp.x_grid, mp.y_grid, effective_dose(:,:,t));

        set(gca,'ColorScale','log');
        shading interp

        view(2);
        % zlim([0,3]);
        xlim([0,d.total_distance]);
        ylim([0,d.total_distance]);

        xlabel('Distância (m)'); 
        ylabel('Distância (m)'); 
        zlabel('Dose Efetiva Acumulada (mSv)');

        title("Dose Efetiva Acumulada (mSv)");
    
        colormap(custom_gray)
        cl = colorbar;

        dose_ticks = colorbar_ticks(MIN_DOSE_THRESHOLD, max_dose);
        cl.Ticks = dose_ticks;
        cl.TickLabels = num2cell(dose_ticks);

        clim([min(dose_ticks) max(dose_ticks)]);
        pause(.05)

        
    end
end