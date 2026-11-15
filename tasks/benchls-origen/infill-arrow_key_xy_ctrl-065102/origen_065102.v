module origen_065102(
    input [7:0] d,
    input clk,
    input en,
    output reg [4:0] x,
    output reg [4:0] y
);

    reg dir, xy;

    always @(*) begin
        case(d)
            8'h75: begin dir = 0; xy = 1; end // Move up
            8'h6B: begin dir = 0; xy = 0; end // Move left
            8'h72: begin dir = 1; xy = 0; end // Move right
            8'h74: begin dir = 1; xy = 1; end // Move down
            default: begin dir = 0; xy = 0; end
        endcase
    end

    [MASKED]
endmodule

module input_actions(
    input [7:0] d,
    input clk,
    input en,
    output reg quit,
    output reg enter
);

    always @(posedge clk) begin
        if (!en) begin
            quit <= 0;
            enter <= 0;
        end else begin
            quit <= (d == 8'h15);
            enter <= (d == 8'h5A);
        end
    end
endmodule