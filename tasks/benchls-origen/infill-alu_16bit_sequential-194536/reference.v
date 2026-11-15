module origen_194536(
    input clk,
    input reset,
    input [15:0] rd_d_in, rs1_d, rs2_d,
    input [3:0] ALU_Sel,
    output reg OpStart,
    input [6:0] count,
    input reg_write,
    input q0_var, q1_var,
    input [5:0] LENGTH,
    output reg [15:0] rd_d_out
);

reg [15:0] result;
reg [1:0] state;
reg carry_borrow;
reg NoOp;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= 0;
        carry_borrow <= 0;
        NoOp <= 0;
        OpStart <= 0;
        result <= 0;
    end
    else begin
        case (state)
            0: begin
                if (ALU_Sel == 0) begin
                    NoOp <= 1;
                    OpStart <= 1;
                    state <= 1;
                end
                else if (ALU_Sel == 1) begin
                    if (q0_var) begin
                        result <= rs1_d + rs2_d;
                        carry_borrow <= result[LENGTH];
                    end
                    else begin
                        result <= rs1_d - rs2_d;
                        carry_borrow <= result[LENGTH];
                    end
                    OpStart <= 1;
                    state <= 1;
                end
                else if (ALU_Sel == 2) begin
                    if (q0_var) begin
                        if (q1_var) begin
                            result <= rs1_d & rs2_d;
                        end
                        else begin
                            result <= rs1_d | rs2_d;
                        end
                    end
                    else begin
                        if (q1_var) begin
                            result <= ~(rs1_d & rs2_d);
                        end
                        else begin
                            result <= ~(rs1_d | rs2_d);
                        end
                    end
                    OpStart <= 1;
                    state <= 1;
                end
                else if (ALU_Sel == 4) begin
                    result <= rs1_d & rs2_d;
                    OpStart <= 1;
                    state <= 1;
                end
            end
            1: begin
                OpStart <= 0;
                if (count == 6'b111111) begin
                    state <= 0;
                    if (reg_write) begin
                        rd_d_out <= result;
                    end
                    else begin
                        result <= 0;
                    end
                end
                else begin
                    state <= 2;
                end
            end
            2: begin
                if (NoOp) begin
                    result <= 0;
                end
                else begin
                    result <= result;
                end
                state <= 0;
            end
        endcase
    end
end

endmodule