module origen_009261(
    input clk,
    input res,
    output reg [2:0] wei,
    output reg [7:0] data
);

reg [24:0] cnt1;
reg [6:0] cnt2;
reg clk1, clk2;
reg [3:0] ge, shi, bai;
reg [3:0] shu;

// Clock division
always @(posedge clk or posedge res) begin
    if (res) begin
        cnt1 <= 0;
        cnt2 <= 0;
        clk1 <= 0;
        clk2 <= 0;
    end else begin
        if (cnt1 == 25000000 - 1) begin
            cnt1 <= 0;
            clk1 <= ~clk1;
        end else begin
            cnt1 <= cnt1 + 1;
        end
        
        if (cnt2 == 100 - 1) begin
            cnt2 <= 0;
            clk2 <= ~clk2;
        end else begin
            cnt2 <= cnt2 + 1;
        end
    end
end

// Counter logic
always @(posedge clk1 or posedge res) begin
    if (res) begin
        ge <= 0;
        shi <= 0;
        bai <= 0;
    end else begin
        if (ge == 9) begin
            ge <= 0;
            if (shi == 9) begin
                shi <= 0;
                if (bai == 9)
                    bai <= 0;
                else
                    bai <= bai + 1;
            end else begin
                shi <= shi + 1;
            end
        end else begin
            ge <= ge + 1;
        end
    end
end

// Display multiplexing
always @(posedge clk2 or posedge res) begin
    if (res)
        wei <= 3'b001;
    else begin
        case (wei)
            3'b001: wei <= 3'b010;
            3'b010: wei <= 3'b100;
            3'b100: wei <= 3'b001;
            default: wei <= 3'b001;
        endcase
    end
end

always @(*) begin
    case (wei)
        3'b001: shu = ge;
        3'b010: shu = shi;
        3'b100: shu = bai;
        default: shu = 4'b0000;
    endcase
end

// Seven-segment display decoder
always @(*) begin
    case (shu)
        4'd0: data = ~8'b11111100;
        4'd1: data = ~8'b01100000;
        4'd2: data = ~8'b11011010;
        4'd3: data = ~8'b11110010;
        4'd4: data = ~8'b01100110;
        4'd5: data = ~8'b10110110;
        4'd6: data = ~8'b10111110;
        4'd7: data = ~8'b11100000;
        4'd8: data = ~8'b11111110;
        4'd9: data = ~8'b11110110;
        default: data = ~8'b00000000;
    endcase
end

endmodule