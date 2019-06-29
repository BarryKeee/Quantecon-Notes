function out1 = pbvp(flag, t, x, dx, A);
switch flag
case 'r'
    out1 = dx - x*A;
case 'b'
    out1 = [x(1,1) - 1; x(2,2)-1];
end