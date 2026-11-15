`define st0 3'b000
`define st1 3'b001
`define st2 3'b010
`define st3 3'b011
`define st4 3'b100
`define st5 3'b101

module origen_174509(
    input [15:0] REGA,
    input clk,
    input rst,
    input en,
    output reg [35:0] REGC,
    output reg done
);

reg [2:0] REGS;
reg [15:0] diff;
reg [4:0] i;
reg [7:0] ai, bi;
reg [35:0] x;
reg E;

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        REGS <= `st0;
        diff <= 0;
        i <= 0;
        ai <= 0;
        bi <= 0;
        x <= 0;
        E <= 0;
        REGC <= 0;
        done <= 0;
    end
    else if (en) begin
        case (REGS)
            `st0: begin
                diff <= REGA;
                ai <= 1;
                bi <= 1;
                REGS <= `st1;
            end
            `st1: begin
                if (bi == 0) begin
                    if (ai == 0) begin
                        E <= 1;
                    end
                    REGS <= `st2;
                end
                else begin
                    bi <= bi - 1;
                end
            end
            `st2: begin
                i <= (ai << 3) + bi;
                if (diff >= (1 << i)) begin
                    REGS <= `st3;
                end
                else begin
                    REGS <= `st4;
                end
            end
            `st3: begin
                diff <= diff - (1 << i);
                x[i] <= 1;
                if (E) begin
                    REGS <= `st5;
                end
                else begin
                    REGS <= `st1;
                end
            end
            `st4: begin
                x[i] <= 0;
                if (E) begin
                    REGS <= `st5;
                end
                else begin
                    REGS <= `st1;
                end
            end
            `st5: begin
                REGC <= x;
                done <= 1;
                REGS <= `st0;
            end
        endcase
    end
end

endmodule