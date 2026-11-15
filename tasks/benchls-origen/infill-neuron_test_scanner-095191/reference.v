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

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            testing_addr <= {ADDR_WIDTH{1'b0}};
            testing_en <= 1'b0;
            sel <= 1'b0;
        end else if (sys_en) begin
            // testing_addr logic
            if (|ext_req) begin
                testing_addr <= testing_addr;
            end else if (dt_tick && ~sel) begin
                testing_addr <= (testing_addr == NEURON_NO-1) ? {ADDR_WIDTH{1'b0}} : testing_addr + 1'b1;
            end else if (~dt_tick && ~sel) begin
                testing_addr <= (testing_addr == NEURON_NO-1) ? testing_addr : testing_addr + 1'b1;
            end

            // testing_en logic
            if (dt_tick && ~(|ext_req)) begin
                testing_en <= 1'b1;
            end else if (testing_addr == NEURON_NO-1 && ~(|ext_req)) begin
                testing_en <= 1'b0;
            end

            // sel logic
            if (dt_tick) begin
                sel <= 1'b1;
            end else begin
                sel <= ~sel;
            end
        end
    end

endmodule