module origen_113290(
    input wire clk,
    input wire rst,
    input wire [15:0][15:0] GrnPixels,
    input wire gameover,
    output reg [3:0] ten_digit,
    output reg [3:0] one_digit
);

    reg [1:0] state, next_state;
    reg buffered_incre;
    
    localparam NONE = 2'b00;
    localparam GOT_ONE = 2'b01;

    wire increment = GrnPixels[0][14] | GrnPixels[15][14];

    [MASKED]

    always @(*) begin
        next_state = state;
        buffered_incre = 1'b0;
        
        case (state)
            NONE: begin
                if (increment) begin
                    next_state = GOT_ONE;
                    buffered_incre = 1'b1;
                end
            end
            GOT_ONE: begin
                if (!increment) begin
                    next_state = NONE;
                end
            end
        endcase
    end

endmodule