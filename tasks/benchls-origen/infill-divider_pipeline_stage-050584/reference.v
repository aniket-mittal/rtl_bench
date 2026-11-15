module origen_050584 #(
    parameter N = 32
) (
    input wire iCLOCK,
    input wire inRESET,
    input wire iREMOVE,
    
    input wire iPREVIOUS_VALID,
    output wire oPREVIOUS_BUSY,
    input wire iPREVIOUS_SIGN,
    input wire [31:0] iPREVIOUS_DIVISOR,
    input wire [31:0] iPREVIOUS_DIVIDEND,
    input wire [N-1:0] iPREVIOUS_Q,
    input wire [30:0] iPREVIOUS_R,
    
    output reg oNEXT_VALID,
    input wire iNEXT_BUSY,
    output reg oNEXT_SIGN,
    output reg [31:0] oNEXT_DIVISOR,
    output reg [31:0] oNEXT_DIVIDEND,
    output reg [N-1:0] oNEXT_Q,
    output reg [30:0] oNEXT_R
);

    // Pass through busy signal
    assign oPREVIOUS_BUSY = iNEXT_BUSY;

    always @(posedge iCLOCK or negedge inRESET) begin
        if (!inRESET) begin
            oNEXT_VALID <= 1'b0;
            oNEXT_SIGN <= 1'b0;
            oNEXT_DIVISOR <= 32'b0;
            oNEXT_DIVIDEND <= 32'b0;
            oNEXT_Q <= {N{1'b0}};
            oNEXT_R <= 31'b0;
        end else if (iREMOVE) begin
            oNEXT_VALID <= 1'b0;
            oNEXT_SIGN <= 1'b0;
            oNEXT_DIVISOR <= 32'b0;
            oNEXT_DIVIDEND <= 32'b0;
            oNEXT_Q <= {N{1'b0}};
            oNEXT_R <= 31'b0;
        end else if (!iNEXT_BUSY && iPREVIOUS_VALID) begin
            oNEXT_VALID <= 1'b1;
            oNEXT_SIGN <= iPREVIOUS_SIGN;
            oNEXT_DIVISOR <= iPREVIOUS_DIVISOR;
            oNEXT_DIVIDEND <= iPREVIOUS_DIVIDEND;
            oNEXT_Q <= iPREVIOUS_Q;
            oNEXT_R <= iPREVIOUS_R;
        end
    end

endmodule