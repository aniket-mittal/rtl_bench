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

    [MASKED]

endmodule