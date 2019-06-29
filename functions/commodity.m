
function out1 = commodity(flag, t, x, dx, r,C,eta,S);
    switch flag
    case 'r'
        out1 = dx - [r*x(:,1)+C -x(:,1).^eta];
    case 'b'
        out1 = x(:,2) - [S; 0];
    end