module origen_025826 (
    input wire ReadClockIn,
    input wire WriteClockIn,
    input wire [9:0] ReadAddressIn,
    input wire [9:0] WriteAddressIn,
    input wire [9:0] WriteAddressIn_TLC,
    input wire [8:0] WriteDataIn,
    input wire [8:0] WriteDataIn_TLC,
    input wire ReadSelectIn,
    input wire WriteSelectIn,
    input wire WriteSelectIn_TLC,
    input wire SMBusyIn,
    output wire [17:0] ReadDataOut,
    output wire [9:0] ReadAddressOut,
    output wire [9:0] WriteAddressOut,
    output wire [8:0] WriteDataOut,
    output wire ReadSelectOut,
    output wire WriteSelectOut,
    output wire ReadSelect_RAM0,
    output wire ReadSelect_RAM1,
    output wire WriteSelect_RAM0,
    output wire WriteSelect_RAM1,
    output wire [17:0] ReadDataOut_SRAM,
    output wire [17:0] ReadDataOut_SRAM_1
);

    reg ReadDataSel;
    wire SMMemoryBankSelect;

    // Read operation
    always @(posedge ReadClockIn) begin
        if (ReadSelectIn)
            ReadDataSel <= ReadAddressIn[9];
    end

    assign ReadSelect_RAM0 = ReadSelectIn & ~ReadAddressIn[9];
    assign ReadSelect_RAM1 = ReadSelectIn & ReadAddressIn[9];

    // Write operation
    assign WriteSelect_RAM0 = (WriteSelectIn & ~WriteAddressIn[9]) | (WriteSelectIn_TLC & ~WriteAddressIn_TLC[9]);
    assign WriteSelect_RAM1 = (WriteSelectIn & WriteAddressIn[9]) | (WriteSelectIn_TLC & WriteAddressIn_TLC[9]);

    // Bank selection logic
    assign SMMemoryBankSelect = SMBusyIn ? ReadAddressIn[9] : ReadDataSel;

    // Output assignments
    assign ReadDataOut = SMMemoryBankSelect ? ReadDataOut_SRAM_1 : ReadDataOut_SRAM;
    assign ReadAddressOut = ReadAddressIn;
    assign WriteAddressOut = WriteSelectIn ? WriteAddressIn : WriteAddressIn_TLC;
    assign WriteDataOut = WriteSelectIn ? WriteDataIn : WriteDataIn_TLC;
    assign ReadSelectOut = ReadSelectIn;
    assign WriteSelectOut = WriteSelectIn | WriteSelectIn_TLC;

endmodule