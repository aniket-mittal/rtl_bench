module origen_033609(
    input wire clk,
    input wire rst,
    output reg [7:0] dataout,
    output reg [2:0] U3_138_A,
    output wire U2_138_select,
    output wire U3_138_select
);

    reg [15:0] cnt_scan;
    reg [2:0] dataout_buf;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt_scan <= 16'd0;
        end else begin
            cnt_scan <= cnt_scan + 1'b1;
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            U3_138_A <= 3'd0;
        end else begin
            U3_138_A <= cnt_scan[15:13];
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dataout_buf <= 3'd0;
        end else begin
            dataout_buf <= U3_138_A;
        end
    end

    always @(*) begin
        case (dataout_buf)
            3'd0: dataout = 8'b11111100;
            3'd1: dataout = 8'b01100000;
            3'd2: dataout = 8'b11011010;
            3'd3: dataout = 8'b11110010;
            3'd4: dataout = 8'b01100110;
            3'd5: dataout = 8'b10110110;
            3'd6: dataout = 8'b10111110;
            3'd7: dataout = 8'b11100000;
            default: dataout = 8'b00000000;
        endcase
    end

    assign U2_138_select = 1'b0;
    assign U3_138_select = 1'b1;

endmodule