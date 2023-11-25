function [] = plot_1D(data_inputs, mp, concentration_per_volume, effective_dose)
    d = data_inputs;
    space = 0:mp.delta_x:d.total_distance;

    figure(3)
    plot(space,concentration_per_volume(:,mp.t_number_of_points), 'k--o','LineWidth',1.5);

%     j = 1;
%     while j <= mp.t_number_of_points
%         figure(1);
%         plot(space,concentration_per_volume(:,j), 'k--o','LineWidth',1.5);
%         ylim([0,d.C_x1]);
%         grid; 
% 
%         xlabel('Distância (m)'); 
%         ylabel('Concentração (Bq/m³)');
%         title("Tempo de simulação " + num2str(mp.delta_t*j, 2) + " s");
% 
%         figure(2);
%         plot(space,effective_dose(:,j), 'r-','LineWidth',1.5);
%         % ylim([0,1]);
%         grid; 
% 
%         xlabel('Distância (m)'); 
%         ylabel('Dose Efetiva Acumulada (mSv)');
%         title("Tempo de simulação " + num2str(mp.delta_t*j, 2) + " s");
%         
%         j = j+1;
%     end
% 
%     figure(3)
%     plot(space,concentration_per_volume(:,mp.t_number_of_points), 'k--o','LineWidth',1.5);
end

