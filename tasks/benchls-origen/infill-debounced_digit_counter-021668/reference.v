module origen_021668(
    input clk,
    input [3:0] btn,
    output reg [15:0] num
);

wire [3:0] pb_out;
reg [3:0] A, B, C, D;

initial begin
    num = 16'h1234;
end

always @(posedge clk) begin
    A <= num[15:12];
    B <= num[11:8];
    C <= num[7:4];
    D <= num[3:0];
end

genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : debounce_buttons
        pbdebounce pb_inst (
            .clk_1ms(clk),
            .button(btn[i]),
            .pbreg(pb_out[i])
        );
    end
endgenerate

always @(posedge clk) begin
    if (pb_out[0]) D <= D + 1;
    if (pb_out[1]) C <= C + 1;
    if (pb_out[2]) B <= B + 1;
    if (pb_out[3]) A <= A + 1;
    
    num <= {A, B, C, D};
end

endmodule

module pbdebounce(
    input clk_1ms,
    input button,
    output reg pbreg
);

reg [7:0] pbshift;

always @(posedge clk_1ms) begin
    pbshift <= {pbshift[6:0], button};
    
    if (pbshift == 8'b0000_0000)
        pbreg <= 1'b0;
    else if (pbshift == 8'b1111_1111)
        pbreg <= 1'b1;
end

endmodule