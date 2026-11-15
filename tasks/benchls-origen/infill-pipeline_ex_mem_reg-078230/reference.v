module origen_078230 (
    input wire clockIn,
    input wire reset,
    input wire stall,
    input wire memStall,
    input wire haltIn,
    input wire regWriteIn,
    input wire mem2RegIn,
    input wire memWriteIn,
    input wire memReadIn,
    input wire [31:0] data1In,
    input wire [31:0] data2In,
    input wire [4:0] regIn,
    input wire [4:0] reg2In,
    output reg haltOut,
    output reg regWriteOut,
    output reg mem2RegOut,
    output reg memWriteOut,
    output reg memReadOut,
    output reg [31:0] data1Out,
    output reg [31:0] data2Out,
    output reg [4:0] regOut,
    output reg [4:0] reg2Out
);

    always @(posedge clockIn or posedge reset) begin
        if (reset) begin
            haltOut <= 1'b0;
            regWriteOut <= 1'b0;
            mem2RegOut <= 1'b0;
            memWriteOut <= 1'b0;
            memReadOut <= 1'b0;
            data1Out <= 32'b0;
            data2Out <= 32'b0;
            regOut <= 5'b0;
            reg2Out <= 5'b0;
        end
        else if (!stall && !memStall) begin
            haltOut <= haltIn;
            regWriteOut <= regWriteIn;
            mem2RegOut <= mem2RegIn;
            memWriteOut <= memWriteIn;
            memReadOut <= memReadIn;
            data1Out <= data1In;
            data2Out <= data2In;
            regOut <= regIn;
            reg2Out <= reg2In;
        end
    end

endmodule