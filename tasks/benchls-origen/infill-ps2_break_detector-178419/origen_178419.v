module origen_178419(
    input ready,
    input clk,
    input reset,
    input [7:0] datain,
    output reg [7:0] dataout
);

reg [1:0] estado, est_sig;

always @(posedge clk or posedge reset) begin
    if (reset)
        estado <= 2'b00;
    else
        estado <= est_sig;
end

[MASKED]

always @(posedge clk or posedge reset) begin
    if (reset)
        dataout <= 8'd0;
    else if (estado == 2'b10 && ready)
        dataout <= datain;
end

endmodule