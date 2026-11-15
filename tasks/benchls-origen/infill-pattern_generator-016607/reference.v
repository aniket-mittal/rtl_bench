module origen_016607 #(
    parameter WIDTH = 32
) (
    input [2:0] Q,
    output reg [WIDTH-1:0][4:0] out
);

    integer i;

    always @(*) begin
        case(Q)
            3'b000: begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    out[i] = 5'b00000;
                end
            end
            3'b001: begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    out[i] = (i % 2 == 0) ? 5'b00000 : 5'b00001;
                end
            end
            3'b010: begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    out[i] = i % 4;
                end
            end
            3'b011: begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    out[i] = i % 8;
                end
            end
            3'b100: begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    out[i] = i % 16;
                end
            end
            3'b101: begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    out[i] = i;
                end
            end
            default: begin
                for (i = 0; i < WIDTH; i = i + 1) begin
                    out[i] = 5'bxxxxx;
                end
            end
        endcase
    end

endmodule