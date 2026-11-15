module origen_026920 (
    input wire iCLOCK,
    input wire inRESET,
    input wire iMTIMER_WORKING,
    input wire [63:0] iMTIMER_COUNT,
    input wire iCONF_WRITE,
    input wire iCONF_ENA,
    input wire iCONF_IRQENA,
    input wire iCONF_64MODE,
    input wire iCONF_PERIODIC,
    input wire iCOUNT_WRITE,
    input wire [1:0] inCOUNT_DQM,
    input wire [63:0] iCOUNT_COUNTER,
    output wire oIRQ
);

    reg [63:0] ini_counter;
    reg [63:0] counter;
    reg ena, irqena, bitmode, periodic;

    always @(posedge iCLOCK or negedge inRESET) begin
        if (!inRESET) begin
            ini_counter <= 64'b0;
            counter <= 64'b0;
            ena <= 1'b0;
            irqena <= 1'b0;
            bitmode <= 1'b0;
            periodic <= 1'b0;
        end else begin
            if (iCONF_WRITE) begin
                ena <= iCONF_ENA;
                irqena <= iCONF_IRQENA;
                bitmode <= iCONF_64MODE;
                periodic <= iCONF_PERIODIC;
            end

            if (iCOUNT_WRITE) begin
                if (!inCOUNT_DQM[0]) ini_counter[31:0] <= iCOUNT_COUNTER[31:0];
                if (!inCOUNT_DQM[1]) ini_counter[63:32] <= iCOUNT_COUNTER[63:32];
                counter <= ini_counter;
            end else if (ena && iMTIMER_WORKING) begin
                if (bitmode ? (counter == iMTIMER_COUNT) : (counter[31:0] == iMTIMER_COUNT[31:0])) begin
                    if (periodic) counter <= ini_counter;
                end else begin
                    counter <= counter + 1'b1;
                end
            end
        end
    end

    assign oIRQ = irqena && ena && iMTIMER_WORKING && 
                  (bitmode ? (counter == iMTIMER_COUNT) : (counter[31:0] == iMTIMER_COUNT[31:0])) &&
                  (bitmode ? (ini_counter != 64'b0) : (ini_counter[31:0] != 32'b0));

endmodule