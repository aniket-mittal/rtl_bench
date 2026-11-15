module MUX4T1_4 (
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    input [1:0] s,
    output [3:0] o
);

    assign o = (s==2'b00) ? I0 :
               (s==2'b01) ? I1 :
               (s==2'b10) ? I2 :
                            I3 ;

endmodule