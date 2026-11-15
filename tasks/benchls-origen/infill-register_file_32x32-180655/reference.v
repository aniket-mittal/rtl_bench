module origen_180655 (
    input [4:0] RA,
    input [4:0] RB,
    input [4:0] RW,
    input [31:0] BusW,
    input RegWr,
    input Clk,
    input Rst,
    output [31:0] BusA,
    output [31:0] BusB,
    output [31:0] regOut0,
    output [31:0] regOut1,
    output [31:0] regOut2,
    output [31:0] regOut3,
    output [31:0] regOut4,
    output [31:0] regOut5,
    output [31:0] regOut6,
    output [31:0] regOut7,
    output [31:0] regOut8,
    output [31:0] regOut9,
    output [31:0] regOut10,
    output [31:0] regOut11,
    output [31:0] regOut12,
    output [31:0] regOut13,
    output [31:0] regOut14,
    output [31:0] regOut15,
    output [31:0] regOut16,
    output [31:0] regOut17,
    output [31:0] regOut18,
    output [31:0] regOut19,
    output [31:0] regOut20,
    output [31:0] regOut21,
    output [31:0] regOut22,
    output [31:0] regOut23,
    output [31:0] regOut24,
    output [31:0] regOut25,
    output [31:0] regOut26,
    output [31:0] regOut27,
    output [31:0] regOut28,
    output [31:0] regOut29,
    output [31:0] regOut30,
    output [31:0] regOut31
);

    reg [31:0] registers [0:31];

    initial begin
        integer i;
        for (i = 0; i < 32; i = i + 1) begin
            registers[i] = 32'b0;
        end
    end

    always @(posedge Clk) begin
        if (Rst) begin
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] = 32'b0;
            end
        end
        else if (RegWr && RW != 5'b0) begin
            registers[RW] = BusW;
        end
    end

    assign BusA = registers[RA];
    assign BusB = registers[RB];

    assign regOut0 = registers[0];
    assign regOut1 = registers[1];
    assign regOut2 = registers[2];
    assign regOut3 = registers[3];
    assign regOut4 = registers[4];
    assign regOut5 = registers[5];
    assign regOut6 = registers[6];
    assign regOut7 = registers[7];
    assign regOut8 = registers[8];
    assign regOut9 = registers[9];
    assign regOut10 = registers[10];
    assign regOut11 = registers[11];
    assign regOut12 = registers[12];
    assign regOut13 = registers[13];
    assign regOut14 = registers[14];
    assign regOut15 = registers[15];
    assign regOut16 = registers[16];
    assign regOut17 = registers[17];
    assign regOut18 = registers[18];
    assign regOut19 = registers[19];
    assign regOut20 = registers[20];
    assign regOut21 = registers[21];
    assign regOut22 = registers[22];
    assign regOut23 = registers[23];
    assign regOut24 = registers[24];
    assign regOut25 = registers[25];
    assign regOut26 = registers[26];
    assign regOut27 = registers[27];
    assign regOut28 = registers[28];
    assign regOut29 = registers[29];
    assign regOut30 = registers[30];
    assign regOut31 = registers[31];

endmodule