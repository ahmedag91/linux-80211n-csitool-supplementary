function surfing(xInput, yInput, Sxx, Xlabel, Ylabel, cmap)
    % plotting - Description
    % This is a plotting function for not repeating myself
    %
    %
    %
    %
    % Syntax: surfing(xInput, yInput, Sxx, Xlabel, Ylabel, cmap)
    % xInput: x-axis input (vector)
    % yInput: y-axis input vector or matrix
    % cmap: colormap of the heatmap (string)
    % legends: cell array of strings describing the legends 
    % Xlabel: x-axis label (string)
    % Ylabel: y-axis label (string)
    figure
    hold on
    surf(xInput, yInput, Sxx);
    colormap(cmap);
    shading interp
    ylabel(Ylabel,'Interpreter','Latex','Fontsize', 30.8);
    xlabel(Xlabel,'Interpreter','Latex','Fontsize', 30.8);
    colorbar
    set(gca,'layer','top');
    set(gca,'fontsize',28);
    grid on;
    box on;
end