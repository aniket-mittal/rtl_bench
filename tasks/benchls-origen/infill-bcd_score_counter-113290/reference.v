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

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= NONE;
            ten_digit <= 4'd0;
            one_digit <= 4'd0;
        end else begin
            state <= next_state;
            
            if (buffered_incre && !gameover) begin
                if (ten_digit == 4'd9 && one_digit == 4'd9) begin
                    // Max score reached, do nothing
                end else if (one_digit == 4'd9) begin
                    one_digit <= 4'd0;
                    ten_digit <= ten_digit + 1;
                end else begin
                    one_digit <= one_digit + 1;
                end
            end
        end
    end

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