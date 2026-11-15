module origen_169579(
    input [31:0] cout_Multiply, zout_Multiply, sout_Multiply, productout_Multiply,
    input [1:0] modeout_Multiply, operationout_Multiply,
    input NatLogFlagout_Multiply, InsTag_Multiply,
    input clock, idle_Multiply,
    output reg idle_NormaliseProd,
    output reg [31:0] cout_NormaliseProd, zout_NormaliseProd, sout_NormaliseProd, productout_NormaliseProd,
    output reg [1:0] modeout_NormaliseProd, operationout_NormaliseProd,
    output reg NatLogFlagout_NormaliseProd, InsTag_NormaliseProd
);

    parameter mode_circular = 2'b00, mode_linear = 2'b01, mode_hyperbolic = 2'b10;
    parameter no_idle = 2'b00, allign_idle = 2'b01, put_idle = 2'b10;

    reg [7:0] exponent;
    reg [23:0] mantissa;

    always @(posedge clock) begin
        if (idle_Multiply == no_idle) begin
            exponent = zout_Multiply[30:23];
            mantissa = zout_Multiply[22:0];

            if (exponent < 8'hfe) begin
                zout_NormaliseProd = {1'b0, exponent + 8'h01, mantissa[22:1]};
                productout_NormaliseProd = productout_Multiply >> 1;
            end else if (mantissa[23] == 1'b0) begin
                zout_NormaliseProd = {1'b0, exponent, mantissa[22:0] << 1};
                productout_NormaliseProd = productout_Multiply << 1;
            end else begin
                zout_NormaliseProd = zout_Multiply;
                productout_NormaliseProd = productout_Multiply;
            end

            cout_NormaliseProd = cout_Multiply;
            sout_NormaliseProd = sout_Multiply;
            modeout_NormaliseProd = modeout_Multiply;
            operationout_NormaliseProd = operationout_Multiply;
            NatLogFlagout_NormaliseProd = NatLogFlagout_Multiply;
            InsTag_NormaliseProd = InsTag_Multiply;
            idle_NormaliseProd = no_idle;
        end else begin
            zout_NormaliseProd = zout_Multiply;
            productout_NormaliseProd = productout_Multiply;
            cout_NormaliseProd = cout_Multiply;
            sout_NormaliseProd = sout_Multiply;
            modeout_NormaliseProd = modeout_Multiply;
            operationout_NormaliseProd = operationout_Multiply;
            NatLogFlagout_NormaliseProd = NatLogFlagout_Multiply;
            InsTag_NormaliseProd = InsTag_Multiply;
            idle_NormaliseProd = idle_Multiply;
        end
    end

endmodule