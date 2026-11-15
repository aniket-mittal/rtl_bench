// RSFF Module
module origen_039795 (
    input wire clk,
    input wire S,
    input wire R,
    input wire Qin,
    output reg Qout,
    output wire Qoutbar
);

    always @(posedge clk) begin
        case ({S, R})
            2'b00: Qout <= Qin;
            2'b01: Qout <= 1'b0;
            2'b10: Qout <= 1'b1;
            2'b11: Qout <= 1'bx;
        endcase
    end

    assign Qoutbar = (S == 1'b1 && R == 1'b1) ? 1'bx : ~Qout;

endmodule

// Testbench
