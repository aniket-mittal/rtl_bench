module origen_057978(
    input [15:0] LINEA,
    input [15:0] LINEB,
    input ADD,
    output reg [15:0] LINEOUT,
    output ADDs
);

assign ADDs = ADD;

always @(*) begin
    if (ADD)
        LINEOUT = LINEA + LINEB;
    else
        LINEOUT = LINEA - LINEB;
end

endmodule

