module origen_164588(
    input w,
    input Reset,
    input clk,
    output reg z
);

    reg [1:0] state;
    parameter A = 2'b00, B = 2'b01, C = 2'b10;

    always @(posedge clk or negedge Reset) begin
        if (~Reset) begin
            state <= A;
            z <= 1'b0;
        end
        else begin
            case (state)
                A: begin
                    if (w) begin
                        state <= B;
                        z <= 1'b0;
                    end
                    else begin
                        state <= A;
                        z <= 1'b0;
                    end
                end
                B: begin
                    if (w) begin
                        state <= B;
                        z <= 1'b0;
                    end
                    else begin
                        state <= C;
                        z <= 1'b0;
                    end
                end
                C: begin
                    if (w) begin
                        state <= A;
                        z <= 1'b1;
                    end
                    else begin
                        state <= A;
                        z <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule