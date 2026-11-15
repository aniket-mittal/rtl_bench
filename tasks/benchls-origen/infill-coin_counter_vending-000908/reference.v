module origen_000908 (
    input wire clock,
    input wire reset,
    input wire enable,
    input wire [1:0] coin_in,
    input wire subNickel,
    input wire subDime,
    input wire dispenseReady,
    output reg [7:0] nickelCount,
    output reg [7:0] dimeCount,
    output reg [7:0] quarterCount
);

    // Parameters for coin types
    parameter nocoin  = 2'b00;
    parameter nickel  = 2'b01;
    parameter dime    = 2'b10;
    parameter quarter = 2'b11;

    // Parameters for dispense amounts (unused in this implementation)
    parameter dispense    = 3'b000;
    parameter dispense5   = 3'b001;
    parameter dispense10  = 3'b010;
    parameter dispense15  = 3'b011;
    parameter dispense20  = 3'b100;

    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            nickelCount <= 8'b0;
            dimeCount <= 8'b0;
            quarterCount <= 8'b0;
        end
        else if (enable) begin
            case (coin_in)
                nickel:  nickelCount <= nickelCount + 1;
                dime:    dimeCount <= dimeCount + 1;
                quarter: quarterCount <= quarterCount + 1;
                default: begin
                    nickelCount <= nickelCount;
                    dimeCount <= dimeCount;
                    quarterCount <= quarterCount;
                end
            endcase
        end
        else begin
            if (subNickel && nickelCount > 0)
                nickelCount <= nickelCount - 1;
            if (subDime && dimeCount > 0)
                dimeCount <= dimeCount - 1;
        end
    end

endmodule