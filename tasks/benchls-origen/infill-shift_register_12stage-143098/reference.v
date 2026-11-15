module origen_143098 #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire clk_ena,
    input wire reset,
    input wire [WIDTH-1:0] in_stream,
    output reg [WIDTH-1:0] pipeline_reg_0,
    output reg [WIDTH-1:0] pipeline_reg_1,
    output reg [WIDTH-1:0] pipeline_reg_2,
    output reg [WIDTH-1:0] pipeline_reg_3,
    output reg [WIDTH-1:0] pipeline_reg_4,
    output reg [WIDTH-1:0] pipeline_reg_5,
    output reg [WIDTH-1:0] pipeline_reg_6,
    output reg [WIDTH-1:0] pipeline_reg_7,
    output reg [WIDTH-1:0] pipeline_reg_8,
    output reg [WIDTH-1:0] pipeline_reg_9,
    output reg [WIDTH-1:0] pipeline_reg_10,
    output reg [WIDTH-1:0] pipeline_reg_11
);

    always @(posedge clk) begin
        if (reset) begin
            pipeline_reg_0 <= {WIDTH{1'b0}};
            pipeline_reg_1 <= {WIDTH{1'b0}};
            pipeline_reg_2 <= {WIDTH{1'b0}};
            pipeline_reg_3 <= {WIDTH{1'b0}};
            pipeline_reg_4 <= {WIDTH{1'b0}};
            pipeline_reg_5 <= {WIDTH{1'b0}};
            pipeline_reg_6 <= {WIDTH{1'b0}};
            pipeline_reg_7 <= {WIDTH{1'b0}};
            pipeline_reg_8 <= {WIDTH{1'b0}};
            pipeline_reg_9 <= {WIDTH{1'b0}};
            pipeline_reg_10 <= {WIDTH{1'b0}};
            pipeline_reg_11 <= {WIDTH{1'b0}};
        end else if (clk_ena) begin
            pipeline_reg_0 <= in_stream;
            pipeline_reg_1 <= pipeline_reg_0;
            pipeline_reg_2 <= pipeline_reg_1;
            pipeline_reg_3 <= pipeline_reg_2;
            pipeline_reg_4 <= pipeline_reg_3;
            pipeline_reg_5 <= pipeline_reg_4;
            pipeline_reg_6 <= pipeline_reg_5;
            pipeline_reg_7 <= pipeline_reg_6;
            pipeline_reg_8 <= pipeline_reg_7;
            pipeline_reg_9 <= pipeline_reg_8;
            pipeline_reg_10 <= pipeline_reg_9;
            pipeline_reg_11 <= pipeline_reg_10;
        end
    end

endmodule