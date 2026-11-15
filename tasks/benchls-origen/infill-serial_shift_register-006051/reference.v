module origen_006051 (
    input wire clk,
    input wire data,
    input wire reset,
    input wire load,
    output wire out
);

reg [3:0] tmp;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        tmp <= 4'b0000;
    end else if (load) begin
        tmp <= {tmp[2:0], data};
    end else begin
        tmp <= {tmp[2:0], 1'b0};
    end
end

assign out = tmp[3];

endmodule

