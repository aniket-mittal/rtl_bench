module origen_070793 (
    input wire clk,
    input wire clrn,
    input wire [31:0] ealu,
    input wire [31:0] eb,
    input wire [31:0] pce,
    input wire [4:0] ern,
    input wire ewreg,
    input wire em2reg,
    input wire ewmem,
    input wire ermem,
    input wire erio,
    input wire ewio,
    output reg [31:0] malu,
    output reg [31:0] mb,
    output reg [31:0] pcm,
    output reg [4:0] mrn,
    output reg mwreg,
    output reg mm2reg,
    output reg mwmem,
    output reg mrmem,
    output reg mrio,
    output reg mwio
);

    always @(posedge clk or negedge clrn) begin
        if (~clrn) begin
            malu <= 32'b0;
            mb <= 32'b0;
            pcm <= 32'b0;
            mrn <= 5'b0;
            mwreg <= 1'b0;
            mm2reg <= 1'b0;
            mwmem <= 1'b0;
            mrmem <= 1'b0;
            mrio <= 1'b0;
            mwio <= 1'b0;
        end else begin
            malu <= ealu;
            mb <= eb;
            pcm <= pce;
            mrn <= ern;
            mwreg <= ewreg;
            mm2reg <= em2reg;
            mwmem <= ewmem;
            mrmem <= ermem;
            mrio <= erio;
            mwio <= ewio;
        end
    end

endmodule