module origen_197257(
    input clock,
    input reset,
    input enable,
    input signed [15:0] phase1,
    input signed [15:0] phase2,
    input signed [15:0] phase3,
    input signed [15:0] phase4,
    output reg signed [15:0] angle1,
    output reg signed [15:0] angle2,
    output reg signed [15:0] angle3,
    output reg signed [15:0] angle4,
    output reg signed [15:0] angle5,
    output reg signed [15:0] angle6
);

reg signed [15:0] ang1, ang2;
reg run_state;
reg [2:0] state;

localparam IDLE = 3'b000;
localparam DIF12 = 3'b001;
localparam DIF13 = 3'b010;
localparam DIF14 = 3'b011;
localparam DIF23 = 3'b100;
localparam DIF24 = 3'b101;
localparam DIF34 = 3'b110;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        ang1 <= 0;
        ang2 <= 0;
        run_state <= 0;
        angle1 <= 0;
        angle2 <= 0;
        angle3 <= 0;
        angle4 <= 0;
        angle5 <= 0;
        angle6 <= 0;
    end
    else begin
        if (enable) begin
            case (state)
                IDLE: begin
                    if (enable) begin
                        state <= DIF12;
                        ang1 <= phase1;
                        ang2 <= phase2;
                        run_state <= 1;
                    end
                end
                DIF12: begin
                    angle1 <= ang1 - ang2;
                    if (run_state) begin
                        run_state <= 0;
                        state <= DIF13;
                        ang1 <= phase1;
                        ang2 <= phase3;
                    end
                end
                DIF13: begin
                    angle2 <= ang1 - ang2;
                    if (run_state) begin
                        run_state <= 0;
                        state <= DIF14;
                        ang1 <= phase1;
                        ang2 <= phase4;
                    end
                end
                DIF14: begin
                    angle3 <= ang1 - ang2;
                    if (run_state) begin
                        run_state <= 0;
                        state <= DIF23;
                        ang1 <= phase2;
                        ang2 <= phase3;
                    end
                end
                DIF23: begin
                    angle4 <= ang1 - ang2;
                    if (run_state) begin
                        run_state <= 0;
                        state <= DIF24;
                        ang1 <= phase2;
                        ang2 <= phase4;
                    end
                end
                DIF24: begin
                    angle5 <= ang1 - ang2;
                    if (run_state) begin
                        run_state <= 0;
                        state <= DIF34;
                        ang1 <= phase3;
                        ang2 <= phase4;
                    end
                end
                DIF34: begin
                    angle6 <= ang1 - ang2;
                    if (run_state) begin
                        run_state <= 0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
end

endmodule