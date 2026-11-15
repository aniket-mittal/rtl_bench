module origen_071564 (
    input wire clk,
    input wire [63:0] data_in,
    output reg [63:0] data_out
);

    always @(posedge clk) begin
        data_out <= data_in;
    end

    initial begin
        data_out = 64'b0;
    end
endmodule

module id_ex (
    input wire clk,
    input wire [177:0] data_in,
    output reg [177:0] data_out
);

    always @(posedge clk) begin
        data_out <= data_in;
    end

    initial begin
        data_out = 178'b0;
    end
endmodule

module ex_mem (
    input wire clk,
    input wire [154:0] data_in,
    output reg [154:0] data_out
);

    always @(posedge clk) begin
        data_out <= data_in;
    end

    initial begin
        data_out = 155'b0;
    end
endmodule

module mem_wb (
    input wire clk,
    input wire [116:0] data_in,
    output reg [116:0] data_out
);

    always @(posedge clk) begin
        data_out <= data_in;
    end

    initial begin
        data_out = 117'b0;
    end
endmodule