module rtlpp_02463(
    mpand,
    mplier,
    modulus,
    product,
    clk,
    ds,
    reset,
    ready
);

parameter [31:0] MPWID = 32;
input [MPWID - 1:0] mpand;
input [MPWID - 1:0] mplier;
input [MPWID - 1:0] modulus;
output [MPWID - 1:0] product;
input clk;
input ds;
input reset;
output ready;

reg [MPWID - 1:0] mpreg;
reg [MPWID + 1:0] mcreg;
wire [MPWID + 1:0] mcreg1; 
reg [MPWID + 1:0] mcreg2;
reg [MPWID + 1:0] modreg1; 
reg [MPWID + 1:0] modreg2;
reg [MPWID + 1:0] prodreg; 
reg [MPWID + 1:0] prodreg1; 
wire [MPWID + 1:0] prodreg2; 
wire [MPWID + 1:0] prodreg3; 
reg [MPWID + 1:0] prodreg4;  
wire [1:0] modstate;
reg first;

assign product = prodreg4[MPWID - 1:0];

always @(*) begin
    case (mpreg[0])
        1'b1: prodreg1 <= prodreg + mcreg;
        default: prodreg1 <= prodreg;
    endcase
end

assign prodreg2 = prodreg1 - modreg1;
assign prodreg3 = prodreg1 - modreg2;

assign modstate = {prodreg3[MPWID + 1], prodreg2[MPWID + 1]};

always @(*) begin
    case (modstate)
        2'b11: prodreg4 <= prodreg1;
        2'b10: prodreg4 <= prodreg2;
        default: prodreg4 <= prodreg3;
    endcase
end

assign mcreg1 = mcreg - modreg1;

always @(*) begin
    case (mcreg1[MPWID])
        1'b1: mcreg2 <= mcreg;
        default: mcreg2 <= mcreg1;
    endcase
end

assign ready = first;

always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        first <= 1'b1;
    end else begin
        if (first == 1'b1) begin
            if (ds == 1'b1) begin
                mpreg <= mplier;
                mcreg <= {2'b00, mpand};
                modreg1 <= {2'b00, modulus};
                modreg2 <= {1'b0, modulus, 1'b0};
                prodreg <= {((MPWID + 1) - (0) + 1){1'b0}};
                first <= 1'b0;
            end
        end else begin
            if (mpreg == 0) begin
                first <= 1'b1;
            end else begin
                mcreg <= {mcreg2[MPWID:0], 1'b0};
                mpreg <= {1'b0, mpreg[MPWID - 1:1]};
                prodreg <= prodreg4;
            end
        end
    end
end

endmodule