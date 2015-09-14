module hw1test;
reg A;
reg B;
wire nA;
wire nB;
wire nAandnB;
wire AB;
wire AorB;
wire nAB; //not AB
wire nAornB; // not A or not B
wire nAorB; // not (A or B)

not Ainv(nA, A);
not Binv(nB, B);
or orgate(AorB, A,B);
and andgate(nAandnB, nA, nB);
and ABandgate1(AB, A, B);
not ABinv(nAB, AB);
not AorBinv(nAorB, AorB);
or nAnBorgate(nAornB, nA, nB);

initial begin
$display("A B | ~A ~B | ~(AB)  ~A+~B | ~(A+B)  ~A~B ");
A = 0; B = 0; #1;
$display("%b %b |  %b  %b |    %b     %b   |    %b      %b", A,B,nA, nB, nAB, nAornB, nAorB, nAandnB);
A = 0; B = 1; #1;
$display("%b %b |  %b  %b |    %b     %b   |    %b      %b", A,B,nA, nB, nAB, nAornB, nAorB, nAandnB);
A = 1; B = 0; #1;
$display("%b %b |  %b  %b |    %b     %b   |    %b      %b", A,B,nA, nB, nAB, nAornB, nAorB, nAandnB);
A = 1; B = 1; #1;
$display("%b %b |  %b  %b |    %b     %b   |    %b      %b", A,B,nA, nB, nAB, nAornB, nAorB, nAandnB);

end

endmodule