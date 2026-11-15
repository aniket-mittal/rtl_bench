module origen_220918 (
    input  wire        clk,
    input  wire        rst,
    input  wire [4:0]  Sel,
    input  wire [31:0] CPIn,
    input  wire        HWInt,
    input  wire        EXLSet,
    input  wire        EXLClr,
    output wire [31:0] CPOut,
    output wire        IntReq,
    output wire [31:0] EPC
);

    reg [31:0] CP0Reg [0:31];
    reg        im;
    reg        exl;
    reg        ie;
    reg [31:0] HWint_lock;
    reg [31:0] EPC_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            im <= 1'b0;
            exl <= 1'b0;
            ie <= 1'b0;
            HWint_lock <= 32'b0;
            EPC_reg <= 32'b0;
            CP0Reg[0] <= 32'b0;
            CP0Reg[1] <= 32'b0;
            // ... (initialize all 32 CP0 registers)
            CP0Reg[31] <= 32'b0;
        end
        else begin
            if (EXLSet) begin
                exl <= 1'b1;
                EPC_reg <= CP0Reg[14];
            end
            else if (EXLClr) begin
                exl <= 1'b0;
            end

            if (Sel < 32) begin
                CP0Reg[Sel] <= CPIn;
            end

            HWint_lock <= HWInt;
        end
    end

    assign CPOut = CP0Reg[Sel];
    assign EPC = EPC_reg;
    assign IntReq = HWint_lock & im & ie & ~exl;

endmodule