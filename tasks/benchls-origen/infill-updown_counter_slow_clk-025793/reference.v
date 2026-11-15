module origen_025793(
    input [7:0] load,
    input clk,
    input rstN,
    input up,
    input down,
    input plN,
    output [15:0] LED
);

reg [7:0] count;
wire clk_slow;

slow_clock slow_clk_gen (
    .clk(clk),
    .rstN(rstN),
    .clk_slow(clk_slow)
);

always @(posedge clk_slow or negedge rstN) begin
    if (!rstN) begin
        count <= 8'b0;
    end else if (!plN) begin
        count <= load;
    end else if (up && !down) begin
        count <= count + 1;
    end else if (!up && down) begin
        count <= count - 1;
    end
end

assign LED = {load, count};

endmodule

module slow_clock(
    input clk,
    input rstN,
    output reg clk_slow
);

reg [31:0] counter;

always @(posedge clk or negedge rstN) begin
    if (!rstN) begin
        counter <= 32'b0;
        clk_slow <= 1'b0;
    end else begin
        if (counter == 32'h05F5E100) begin
            counter <= 32'b0;
            clk_slow <= ~clk_slow;
        end else begin
            counter <= counter + 1;
        end
    end
end

endmodule