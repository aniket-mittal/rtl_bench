module origen_132614 (
    input wire clk_i,
    input wire rst_i,
    input wire flush_i,
    input wire stb_i,
    input wire [15:0] di,
    input wire next_i,
    output wire can_burst_o,
    output reg do8_valid,
    output reg [7:0] do8
);

    reg [15:0] storage [0:7];
    reg [2:0] produce, consume;
    reg [3:0] level;

    wire [2:0] next_produce = (produce == 3'b111) ? 3'b000 : produce + 1'b1;
    wire [2:0] next_consume = (consume == 3'b111) ? 3'b000 : consume + 1'b1;

    assign can_burst_o = (level >= 4'd14);

    always @(posedge clk_i or posedge flush_i) begin
        if (flush_i) begin
            produce <= 3'b000;
            consume <= 3'b000;
            level <= 4'b0000;
            do8_valid <= 1'b0;
        end else if (rst_i) begin
            produce <= 3'b000;
            consume <= 3'b000;
            level <= 4'b0000;
            do8_valid <= 1'b0;
        end else begin
            if (stb_i && level < 4'd16) begin
                storage[produce] <= di;
                produce <= next_produce;
                level <= level + 1'b1;
            end

            if (next_i && do8_valid) begin
                consume <= next_consume;
                level <= level - 1'b1;
            end

            do8_valid <= (level > 4'd0);
        end
    end

    always @(*) begin
        if (level > 4'd0) begin
            do8 = (consume[0]) ? storage[consume[2:1]][15:8] : storage[consume[2:1]][7:0];
        end else begin
            do8 = 8'h00;
        end
    end

endmodule