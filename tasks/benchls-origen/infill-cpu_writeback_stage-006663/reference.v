`define LOAD 5'b00010
`define R0 3'b000
`define R1 3'b001
`define R2 3'b010
`define R3 3'b011
`define R4 3'b100
`define R5 3'b101
`define R6 3'b110
`define R7 3'b111

module origen_006663 (
    input wire clock,
    input wire reset,
    input wire state,
    input wire cf,
    input wire hit,
    input wire [15:0] mem_ir,
    input wire [15:0] d_datain,
    input wire [15:0] reg_C,
    input wire [15:0] cachedata,
    output reg [15:0] wb_ir,
    output reg [15:0] reg_C1,
    output reg [127:0] all
);

    // State parameters
    localparam IDLE = 1'b0;
    localparam EXEC = 1'b1;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            wb_ir <= 16'b0;
            reg_C1 <= 16'b0;
            all <= 128'b0;
        end
        else if (state == EXEC) begin
            wb_ir <= mem_ir;

            if (mem_ir[15:11] == `LOAD) begin
                if (hit) begin
                    reg_C1 <= cachedata;
                end
                else begin
                    reg_C1 <= d_datain;
                end
                all <= all + 1;
            end
            else begin
                reg_C1 <= reg_C;
            end
        end
    end

endmodule