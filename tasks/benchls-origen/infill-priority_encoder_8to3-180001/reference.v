module origen_180001(d, q0, q1, q2);
    input [7:0] d;
    output reg q0, q1, q2;

    always @(*) begin
        case (d)
            8'b0000001x: begin
                q0 = 1;
                q1 = 0;
                q2 = 0;
            end
            8'b000001xx: begin
                q0 = 0;
                q1 = 1;
                q2 = 0;
            end
            8'b00001xxx: begin
                q0 = 1;
                q1 = 1;
                q2 = 0;
            end
            8'b0001xxxx: begin
                q0 = 0;
                q1 = 0;
                q2 = 1;
            end
            8'b001xxxxx: begin
                q0 = 1;
                q1 = 0;
                q2 = 0;
            end
            8'b01xxxxxx: begin
                q0 = 0;
                q1 = 1;
                q2 = 0;
            end
            8'b1xxxxxxx: begin
                q0 = 1;
                q1 = 0;
                q2 = 0;
            end
            default: begin
                q0 = 0;
                q1 = 0;
                q2 = 0;
            end
        endcase
    end
endmodule