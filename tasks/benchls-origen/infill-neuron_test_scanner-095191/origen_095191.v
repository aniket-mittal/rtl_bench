module origen_095191 #(
    parameter NEURON_NO = 256
)(
    input wire clk,
    input wire reset,
    input wire sys_en,
    input wire [1:0] ext_req,
    input wire dt_tick,
    output reg testing_en,
    output reg [$clog2(NEURON_NO)-1:0] testing_addr,
    output reg sel
);

    // Calculate the width of testing_addr based on NEURON_NO
    localparam ADDR_WIDTH = $clog2(NEURON_NO);

    // Initialize registers
    initial begin
        testing_addr = NEURON_NO - 1;
        testing_en = 1'b0;
        sel = 1'b0;
    end

    [MASKED]

endmodule