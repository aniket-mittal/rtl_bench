module origen_112909 #(parameter N = 21) (
    input clk,
    input rst,
    input en,
    input [3:0] B,
    output reg [3:0] y,
    output reg win,
    output reg lose
);

    // State encoding
    localparam [2:0] s0 = 3'b000,
                     s1 = 3'b001,
                     s2 = 3'b010,
                     s3 = 3'b011,
                     swin = 3'b100,
                     slose = 3'b101;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s0;
        else if (en)
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            s0: next_state = (B == 4'b0000) ? s1 : (B[0]) ? slose : swin;
            s1: next_state = (B == 4'b0000) ? s2 : (B[1]) ? slose : swin;
            s2: next_state = (B == 4'b0000) ? s3 : (B[2]) ? slose : swin;
            s3: next_state = (B == 4'b0000) ? s0 : (B[3]) ? slose : swin;
            swin: next_state = swin;
            slose: next_state = slose;
            default: next_state = s0;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            s0: begin y = 4'b0001; win = 0; lose = 0; end
            s1: begin y = 4'b0010; win = 0; lose = 0; end
            s2: begin y = 4'b0100; win = 0; lose = 0; end
            s3: begin y = 4'b1000; win = 0; lose = 0; end
            swin: begin y = 4'b1111; win = 1; lose = 0; end
            slose: begin y = 4'b0000; win = 0; lose = 1; end
            default: begin y = 4'b0000; win = 0; lose = 0; end
        endcase
    end

endmodule