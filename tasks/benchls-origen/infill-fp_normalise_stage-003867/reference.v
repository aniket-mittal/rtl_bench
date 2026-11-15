module origen_003867 (
    input wire [35:0] cout_Multiply, zout_Multiply,
    input wire [31:0] sout_Multiply,
    input wire [49:0] productout_Multiply,
    input wire [1:0] modeout_Multiply, idle_Multiply,
    input wire operationout_Multiply, NatLogFlagout_Multiply,
    input wire [7:0] InsTag_Multiply,
    input wire clock,
    output reg [35:0] cout_Normalise, zout_Normalise,
    output reg [31:0] sout_Normalise,
    output reg [49:0] productout_Normalise,
    output reg [1:0] modeout_Normalise, idle_Normalise,
    output reg operationout_Normalise, NatLogFlagout_Normalise,
    output reg [7:0] InsTag_Normalise
);

    wire sign = zout_Multiply[35];
    wire [7:0] exponent = zout_Multiply[34:27];
    wire [26:0] mantissa = zout_Multiply[26:0];

    always @(posedge clock) begin
        cout_Normalise <= cout_Multiply;
        sout_Normalise <= sout_Multiply;
        modeout_Normalise <= modeout_Multiply;
        idle_Normalise <= idle_Multiply;
        operationout_Normalise <= operationout_Multiply;
        NatLogFlagout_Normalise <= NatLogFlagout_Multiply;
        InsTag_Normalise <= InsTag_Multiply;

        if (idle_Multiply == 2'b00) begin // no_idle
            if ($signed(exponent) < -8'd126) begin
                zout_Normalise[34:27] <= exponent + 8'd1;
                productout_Normalise <= {1'b0, productout_Multiply[49:1]};
                zout_Normalise[26:0] <= productout_Normalise[49:23];
            end else if (productout_Multiply[49] == 1'b0) begin
                zout_Normalise[34:27] <= exponent - 8'd1;
                productout_Normalise <= {productout_Multiply[48:0], 1'b0};
                zout_Normalise[26:0] <= productout_Normalise[49:23];
            end else begin
                zout_Normalise[34:27] <= exponent;
                productout_Normalise <= productout_Multiply;
                zout_Normalise[26:0] <= productout_Multiply[49:23];
            end
            zout_Normalise[35] <= sign;
        end else begin
            zout_Normalise <= zout_Multiply;
            productout_Normalise <= productout_Multiply;
        end
    end

endmodule