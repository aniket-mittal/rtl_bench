module origen_045727(
    input CLK100MHZ,
    input CLKSLOW,
    input [15:0] ir_inst,
    output reg pc_load,
    output reg pc_clear,
    output reg pc_inc,
    output reg ir_load,
    output reg mb_sel,
    output reg [7:0] mb_addr,
    output reg mb_read,
    output reg mb_write,
    output reg [7:0] dp_imm,
    output reg [1:0] dp_sel,
    output reg [3:0] dp_write_addr,
    output reg dp_write,
    output reg [3:0] dp_a_addr,
    output reg dp_a_read,
    output reg [3:0] dp_b_addr,
    output reg dp_b_read,
    output reg [3:0] dp_alu_sel
);

    reg [3:0] state, n_state;

    always @(posedge CLKSLOW) begin
        state <= n_state;
    end

    [MASKED]

endmodule