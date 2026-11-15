module origen_002856 (
    input wire w, Clock, Resetn,
    output reg z
);

    reg [2:0] y, Y;
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

    always @(posedge Clock, negedge Resetn)
    begin
        if (!Resetn) begin
            y <= A;
            z <= 1'b0;
        end
        else begin
            y <= Y;
            case (y)
                A: begin
                    Y = w ? B : E;
                    z <= 1'b0;
                end
                B: begin
                    Y = w ? C : F;
                    z <= 1'b0;
                end
                C: begin
                    Y = w ? A : D;
                    z <= 1'b0;
                end
                D: begin
                    Y = w ? B : E;
                    z <= 1'b1;
                end
                E: begin
                    Y = w ? F : C;
                    z <= 1'b0;
                end
                F: begin
                    Y = w ? D : A;
                    z <= 1'b0;
                end
                default: begin
                    Y = 3'bxxx;
                    z <= 1'b0;
                end
            endcase
        end
    end

endmodule