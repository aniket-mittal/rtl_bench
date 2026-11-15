module origen_082004 (
    input [31:0] PC,
    input reset,
    input stall,
    input stall_reg,
    output reg REIC,
    output reg REBIOS,
    output reg REISR,
    output reg [1:0] IFSel
);

    wire [3:0] pctop;
    assign pctop = PC[31:28];

    always @(*) begin
        if (reset) begin
            REIC = 1'b0;
            REBIOS = 1'b0;
            REISR = 1'b0;
            IFSel = 2'b00;
        end else begin
            case (pctop)
                4'b0001: begin
                    REIC = 1'b1;
                    REBIOS = 1'b0;
                    REISR = 1'b0;
                    IFSel = 2'b00;
                end
                4'b0100: begin
                    REIC = 1'b0;
                    REBIOS = ~stall;
                    REISR = 1'b0;
                    IFSel = 2'b01;
                end
                4'b1100: begin
                    REIC = 1'b0;
                    REBIOS = 1'b0;
                    REISR = 1'b1;
                    IFSel = 2'b10;
                end
                default: begin
                    REIC = 1'b0;
                    REBIOS = 1'b0;
                    REISR = 1'b0;
                    IFSel = 2'b00;
                end
            endcase
        end
    end

endmodule