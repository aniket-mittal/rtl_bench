module origen_153627(
    input clk,
    output reg red,
    output reg amber,
    output reg green
);

reg [2:0] current;

always @(posedge clk) begin
    case (current)
        3'b000: begin
            red = 0;
            amber = 0;
            green = 0;
            current = 3'b001;
        end
        3'b001: begin
            red = 1;
            amber = 1;
            green = 0;
            current = 3'b011;
        end
        3'b011: begin
            red = 0;
            amber = 0;
            green = 1;
            current = 3'b100;
        end
        3'b100: begin
            red = 0;
            amber = 1;
            green = 0;
            current = 3'b010;
        end
        3'b010: begin
            red = 1;
            amber = 0;
            green = 0;
            current = 3'b001;
        end
        default: begin
            red = 0;
            amber = 0;
            green = 0;
            current = 3'b000;
        end
    endcase
end

endmodule