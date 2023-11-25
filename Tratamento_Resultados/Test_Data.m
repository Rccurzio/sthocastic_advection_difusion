% Parâmetros da distribuição normal
mu = 0;         % Média
sigma = 1;      % Desvio padrão

% Gerar vetor de variáveis aleatórias seguindo distribuição normal
dados = zscore(dados_estoc(50,:));

% Plotar PDF
histogram(dados, 'Normalization', 'pdf', 'EdgeColor', 'white');
hold on;

% Calcular a PDF teórica
x = linspace(min(dados), max(dados), 100);
pdf_normal = normpdf(x, mu, sigma);

% Plotar a PDF teórica
plot(x, pdf_normal, 'LineWidth', 2);

% Adicionar rótulos e título ao gráfico
xlabel('Valores');
ylabel('Densidade de Probabilidade');
title('PDF de uma Distribuição Normal');

% Adicionar legenda
legend('Amostra', 'PDF Teórica');

% Exibir a grade no gráfico
grid on;

% Remover a sobreposição do gráfico
hold off;