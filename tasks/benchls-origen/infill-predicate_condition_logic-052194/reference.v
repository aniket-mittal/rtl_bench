module origen_052194(
    input [8:0] opUCmd,
    input [8:0] opUIxt,
    input [7:0] regInSr,
    output predBit
);

`ifdef jx2_enable_pred_s
    reg [5:0] selector;
    reg tOpEnable;
    wire opBraFlush = 1'b0;

    always @(*) begin
        selector = {opBraFlush, opUCmd[8:6], regInSr[1:0]};
        case(selector)
            6'b000000: tOpEnable = 1'b1;
            6'b000001: tOpEnable = 1'b0;
            6'b000010: tOpEnable = 1'b1;
            6'b000011: tOpEnable = 1'b0;
            6'b000100: tOpEnable = 1'b0;
            6'b000101: tOpEnable = 1'b1;
            6'b000110: tOpEnable = 1'b0;
            6'b000111: tOpEnable = 1'b1;
            6'b001000: tOpEnable = regInSr[7];
            6'b001001: tOpEnable = ~regInSr[7];
            6'b001010: tOpEnable = regInSr[6];
            6'b001011: tOpEnable = ~regInSr[6];
            default:   tOpEnable = 1'b1;
        endcase
    end
`else
    reg [3:0] selector;
    reg tOpEnable;
    wire opBraFlush = 1'b0;

    always @(*) begin
        selector = {opBraFlush, opUCmd[7:6], regInSr[0]};
        case(selector)
            4'b0000: tOpEnable = 1'b1;
            4'b0001: tOpEnable = 1'b0;
            4'b0010: tOpEnable = 1'b1;
            4'b0011: tOpEnable = 1'b0;
            4'b0100: tOpEnable = regInSr[7];
            4'b0101: tOpEnable = ~regInSr[7];
            default: tOpEnable = 1'b1;
        endcase
    end
`endif

assign predBit = ~tOpEnable;

endmodule