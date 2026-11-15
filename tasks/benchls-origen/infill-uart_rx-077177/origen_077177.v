module origen_077177(
    input wire clk,
    input wire rx,
    output reg [7:0] dataout,
    output reg rdsig,
    output reg frameerror,
    input wire paritymode
);

    reg [3:0] state;
    reg [7:0] cnt;
    reg [2:0] bitcnt;
    reg presult;
    reg rx_d1, rx_d2;

    parameter IDLE = 4'd0;
    parameter START = 4'd1;
    parameter RECEIVE = 4'd2;
    parameter PARITY = 4'd3;
    parameter STOP = 4'd4;

    always @(posedge clk) begin
        rx_d1 <= rx;
        rx_d2 <= rx_d1;
    end

    [MASKED]

endmodule