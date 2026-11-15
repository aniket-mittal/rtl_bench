module origen_106430 (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire coin5_flag,
    input wire coin10_flag,
    input wire reset_flag,
    output reg [7:0] paid,
    output reg [7:0] change,
    output reg open
);

    // State encoding
    localparam [2:0] S0 = 3'b000,  // 0 units
                     S1 = 3'b001,  // 5 units
                     S2 = 3'b010,  // 10 units
                     S3 = 3'b011,  // 15 units (dispense)
                     S4 = 3'b100;  // 20 units (dispense + change)

    reg [2:0] cstate, nstate;

    // State register
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (~sys_rst_n)
            cstate <= S0;
        else
            cstate <= nstate;
    end

    // Next state logic and output logic
    [MASKED]

endmodule