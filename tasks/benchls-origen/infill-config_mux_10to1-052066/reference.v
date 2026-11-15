module origen_052066 (
    input wire clk,
    input wire reset,
    input wire config_en,
    input wire [31:0] config_data,
    input wire [31:0] config_addr,
    input wire [15:0] in_0,
    input wire [15:0] in_1,
    input wire [15:0] in_2,
    input wire [15:0] in_3,
    input wire [15:0] in_4,
    input wire [15:0] in_5,
    input wire [15:0] in_6,
    input wire [15:0] in_7,
    input wire [15:0] in_8,
    input wire [15:0] in_9,
    output reg [15:0] out,
    output reg [31:0] read_data
);

    reg [31:0] config_cb;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            config_cb <= 32'd13;
        end else if (config_en && config_addr[31:24] == 8'd0) begin
            config_cb <= config_data;
        end
    end

    always @(*) begin
        if (config_addr[31:24] == 8'd0) begin
            read_data = config_cb;
        end else begin
            read_data = 32'd0;
        end
    end

    always @(*) begin
        case (config_cb[3:0])
            4'd0: out = in_0;
            4'd1: out = in_1;
            4'd2: out = in_2;
            4'd3: out = in_3;
            4'd4: out = in_4;
            4'd5: out = in_5;
            4'd6: out = in_6;
            4'd7: out = in_7;
            4'd8: out = in_8;
            4'd9: out = in_9;
            default: out = 16'd0;
        endcase
    end

endmodule