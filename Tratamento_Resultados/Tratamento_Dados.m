clear all, close all, clc
 
% Carregando o vetor de dados (100 linhas x 30 colunas)
dados_estoc = xlsread("Data_Simulation.xlsx");
dados_det = load("DadosDeterm.txt");

% Valor de z para construção do IC para NC = 95
z = 1.96;

% Número de linhas e colunas
numLinhas  = size(dados_estoc,1);
numColunas = size(dados_estoc,2);

% Armazenando cada concentração em vetores separados
vetoresSeparados = cell(1, numLinhas);

for i = 1:numLinhas
    vetoresSeparados{i} = dados_estoc(i,:);
end

% Inicialização dos vetores para armazenar médias e desvios padrão
media    = zeros(1, numLinhas);
Desv_Pad = zeros(1, numLinhas);

% Cálculo de média, desvpad e IV para cada vetor
for i = 1:numLinhas
    vetorAtual = vetoresSeparados{i};
    media(i) = mean(vetorAtual);
    Desv_Pad(i) = std(vetorAtual);
    LIC_Mean(i) = media(i) - z*Desv_Pad(i)/sqrt(numColunas);
    UIC_Mean(i) = media(i) - z*Desv_Pad(i)/sqrt(numColunas);
end

    media = media';
    Desv_Pad = Desv_Pad';
    LIC_Mean = LIC_Mean';
    UIC_Mean = UIC_Mean';

% Visualização dos resultados

% Seleção das rodadas a serem plotadas 
indicesSelecionados = find(rem(1:numColunas, 3) == 0);

% Definição das Cores e Marcadores diferentes para cada linha
cores = lines(length(indicesSelecionados));
marcadores = {'o', '+', '*', '.', 'x', 's', 'd', '^', 'v', '>'};

% Plotagem das Rodadas de Simulação
figure(1)
hold on

    for i = 1:length(indicesSelecionados)
        indiceColuna = indicesSelecionados(i);
        plot(dados_estoc(:, indiceColuna), 'DisplayName', ['Rodada' num2str(indiceColuna/3)],'Color', cores(i, :), 'Marker', marcadores{i});  
    end

    plot(dados_det,'DisplayName', 'Determinístico', 'Color', 'k', 'LineWidth', 2);
    
    xlabel('Distância (m)');
    ylabel('Concentração (Bq/m³)');
    title('Comportamento da Dispersão do Contaminante');
    grid on;
    box on;
    legend('show');

hold off

% Parâmetros da distribuição normal
mu = 0;         % Média
sigma = 1;      % Desvio padrão

% Vetor de Variáveis Aleatórias Normalizado
dados = zscore(dados_estoc(50,:));

% Cálculo da PDF/CDF teórica
x = linspace(min(dados), max(dados), 100);
IC_Inf = mu - z*sigma/sqrt(numColunas);
IC_Sup = mu + z*sigma/sqrt(numColunas);
pdf_normal = normpdf(x, mu, sigma);
cdf_normal = cdf('Normal',x,mu,sigma);

% Plotagem da PDF associada
figure(2)
    plot(x, pdf_normal,'k', 'LineWidth', 2);
    xline(mu,'k:','LineWidth',1.5);
    xline(IC_Inf,'r:','LineWidth',1.5)
    xline(IC_Sup,'b:','LineWidth',1.5)
    xlabel('Valores para concentração a 50 m da fonte');
    ylabel('Distribuição de Probabilidade');
    title('PDF da Variável Aleatória Concentração');
    legend('PDF','média amostral','LI IC','LS IC');
    grid on;
    axis([-2.5 2.5 0 0.4])

% Plotagem do Histograma
figure(3)
    histogram(dados_estoc(50,:),6, 'Normalization', 'pdf', 'EdgeColor', 'white');
    xlabel('Valores para concentração a 50 m da fonte');
    ylabel('Frequência');
    title('Diagrama de Frequência da Variável Aleatória Concentração');
    grid on;

% Plotagem da CDF associada
figure(4)
    plot(x,cdf_normal,'k','LineWidth',2);
    xlabel('Valores para concentração a 50 m da fonte');
    ylabel('Distribuição Acumulada');
    title('CDF da Variável Aleatória Concentração');
    legend('CDF');
    grid on;
    axis([-2.5 2.5 0 1])
  
% Obter a covariância entre x e y
xfit = linspace(0,1,100)';
yfit = dados_estoc(:,15);
matriz_covariancia = cov(xfit, yfit);
Cov_xy = matriz_covariancia(1, 2)
rho_xy = Cov_xy/(std(xfit)*std(yfit))

