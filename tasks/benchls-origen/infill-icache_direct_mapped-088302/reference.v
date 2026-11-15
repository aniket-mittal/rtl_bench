module origen_088302 (
    input wire clk,
    input wire reset,
    input wire [31:0] address,
    input wire [127:0] data_line,
    output reg hit,
    output reg [31:0] instruction
);

    reg [152:0] cache [0:63];  // 64 cache lines, each 153 bits wide
    reg [2:0] delay_counter;

    wire [1:0] offset;
    wire [5:0] set_index;
    wire [23:0] tag;

    assign offset = address[1:0];
    assign set_index = address[7:2];
    assign tag = address[31:8];

    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hit <= 0;
            instruction <= 32'b0;
            delay_counter <= 3'b0;
            for (i = 0; i < 64; i = i + 1) begin
                cache[i] <= 153'b0;
            end
        end else begin
            #0.5;  // 0.5 time unit delay
            if (cache[set_index][152] && cache[set_index][151:128] == tag) begin
                hit <= 1;
                case (offset)
                    2'b00: instruction <= cache[set_index][127:96];
                    2'b01: instruction <= cache[set_index][95:64];
                    2'b10: instruction <= cache[set_index][63:32];
                    2'b11: instruction <= cache[set_index][31:0];
                endcase
            end else begin
                hit <= 0;
                instruction <= 32'b0;
                if (delay_counter == 3'b111) begin
                    cache[set_index] <= {1'b1, tag, data_line};
                    delay_counter <= 3'b0;
                end else begin
                    delay_counter <= delay_counter + 1;
                end
            end
        end
    end

endmodule