module origen_214217 #(
    parameter MHZ = 20,
    parameter HZ = 100,
    parameter MAX = (MHZ * 1000000) / HZ
)(
    input wire clk,
    input wire busrst,
    input wire kwreq,
    input wire kwwr,
    input wire [15:0] kwwdata,
    output reg [15:0] kwrdata,
    output reg kwack,
    output reg kwirq
);

    reg [15:0] ctr;
    reg mon, mon0, ie;

    [MASKED]

    always @(*) begin
        kwrdata = {15'b0, mon};
    end

endmodule