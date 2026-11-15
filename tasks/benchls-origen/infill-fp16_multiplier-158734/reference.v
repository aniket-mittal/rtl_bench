module origen_158734(
    input  wire [15:0] in_A,
    input  wire [15:0] in_B,
    input  wire        in_En,
    input  wire        clk,
    input  wire        rst,
    output wire [15:0] out_Out,
    output wire        out_Ready
);

    // Internal signals
    wire        signWire;
    wire [4:0]  exponentWire;
    wire [20:0] beforeShift;
    wire [10:0] fractionWire;

    // Intermediate registers
    reg         signMidReg;
    reg [4:0]   exponentMidReg;
    reg [10:0]  fractionMidReg;
    reg         readyMidReg;

    // Sign computation
    assign signWire = in_A[15] ^ in_B[15];

    // Exponent computation
    assign exponentWire = in_A[14:10] + in_B[14:10] - 5'd15;

    // Mantissa multiplication
    assign beforeShift = in_A[9:0] * in_B[9:0];

    // Normalize the result
    assign fractionWire = beforeShift[20:10];

    // Intermediate result registers
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            signMidReg    <= 1'b0;
            exponentMidReg <= 5'b0;
            fractionMidReg <= 11'b0;
            readyMidReg    <= 1'b0;
        end
        else if (in_En) begin
            signMidReg    <= signWire;
            exponentMidReg <= exponentWire;
            fractionMidReg <= fractionWire;
            readyMidReg    <= 1'b1;
        end
    end

    // Output calculation
    wire [4:0] exponentWireOut;
    wire [9:0] fractionWireOut;
    assign exponentWireOut = exponentMidReg + (fractionMidReg[10] ? 1'b1 : 1'b0);
    assign fractionWireOut = fractionMidReg[9:0];
    assign out_Out = {signMidReg, exponentWireOut, fractionWireOut};
    assign out_Ready = readyMidReg;

endmodule