module origen_051523(J, K, C, Q, NQ);
    input J, K, C;
    output reg Q;
    output NQ;

    initial Q = 1'b0;

    [MASKED]

    assign NQ = ~Q;
endmodule

module contador(C, Q);
    input C;
    output [3:0] Q;

    wire J3, K3, J2, K2, J1, K1, J0, K0;
    wire NQ3, NQ2, NQ1, NQ0;

    assign J3 = Q[2] & Q[1] & Q[0];
    assign K3 = ~Q[2] | ~Q[1] | ~Q[0];
    assign J2 = ~Q[0];
    assign K2 = Q[0];
    assign J1 = Q[0];
    assign K1 = 1'b1;
    assign J0 = Q[2];
    assign K0 = ~Q[2];

    JKdown FF3(J3, K3, C, Q[3], NQ3);
    JKdown FF2(J2, K2, C, Q[2], NQ2);
    JKdown FF1(J1, K1, C, Q[1], NQ1);
    JKdown FF0(J0, K0, C, Q[0], NQ0);
endmodule

module test;
    reg C;
    wire [3:0] Q;

    contador counter(C, Q);

    initial begin
        C = 0;
        counter.FF3.Q = 0;
        counter.FF2.Q = 1;
        counter.FF1.Q = 1;
        counter.FF0.Q = 0;
        
        $monitor("Time=%0t C=%b Q=%b", $time, C, Q);
        #100 ;
    end

    always #5 C = ~C;
endmodule