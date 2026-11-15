module origen_057978(
    input [15:0] LINEA,
    input [15:0] LINEB,
    input ADD,
    output reg [15:0] LINEOUT,
    output ADDs
);

assign ADDs = ADD;

[MASKED]

endmodule

module TestALU;
    reg [15:0] LINEA, LINEB;
    reg ADD;
    wire [15:0] LINEOUT;
    wire ADDs;

    ALU uut (
        .LINEA(LINEA),
        .LINEB(LINEB),
        .ADD(ADD),
        .LINEOUT(LINEOUT),
        .ADDs(ADDs)
    );

    initial begin
        LINEA = 16'h0000;
        LINEB = 16'h0000;
        ADD = 1'b0;

        #1;
        LINEA = 16'h0060;
        LINEB = 16'h4C00;
        ADD = 1'b1;

        #1;
        LINEA = 16'h0700;
        LINEB = 16'h0100;
        ADD = 1'b0;

        #1;
        LINEA = 16'hF000;
        LINEB = 16'h3000;
        ADD = 1'b0;

        #1;
        LINEA = 16'hF070;
        LINEB = 16'h0F07;
        ADD = 1'b0;
    end
endmodule