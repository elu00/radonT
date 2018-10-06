function integral = Radon(image, t, theta, N)
    [X, Y] = meshgrid(linspace(-1, 1, N), linspace(-1, 1, N));
    
    X1 = cos(theta+acos(t));
    Y1 = sin(theta+acos(t));
    
    X2 = cos(theta-acos(t));
    Y2 = sin(theta-acos(t));
    
    dist = sqrt((X1-X2)^2+(Y1-Y2)^2);
    
    Xq = linspace(X1, X2, 100);
    Yq = linspace(Y1, Y2, 100);
    
    integral = sum(interp2(X, Y, image, Xq, Yq, 'cubic'))*dist/100;
end