module origen_202146(
    input [3:0] comandControler,
    output reg [3:0] tULAControler,
    output reg [2:0] tXControler,
    output reg [2:0] tYControler,
    output reg [2:0] tZControler
);

parameter CLR = 4'b0000;
parameter CLRLD = 4'b0001;
parameter LOADX = 4'b0010;
parameter ADD = 4'b0011;
parameter SUB = 4'b0100;
parameter MULT = 4'b0101;
parameter DIV = 4'b0110;
parameter MIN = 4'b0111;
parameter MAX = 4'b1000;
parameter DISP = 4'b1001;
parameter END = 4'b1010;

parameter uADD = 4'b0000;
parameter uSUB = 4'b0001;
parameter uCOMP = 4'b0010;
parameter uIGUAL = 4'b0011;
parameter uMAIOR = 4'b0100;
parameter uMENOR = 4'b0101;
parameter uAND = 4'b0110;
parameter uOR = 4'b0111;
parameter uMULT = 4'b1000;
parameter uDIV = 4'b1001;

parameter rHOLD = 3'b000;
parameter rRESET = 3'b001;
parameter rLOAD = 3'b010;
parameter rShiftLeft = 3'b011;
parameter rShiftRight = 3'b100;

always @(*) begin
    case (comandControler)
        CLR: begin
            tULAControler = uADD;
            tXControler = rRESET;
            tYControler = rRESET;
            tZControler = rRESET;
        end
        CLRLD: begin
            tULAControler = uADD;
            tXControler = rLOAD;
            tYControler = rLOAD;
            tZControler = rLOAD;
        end
        LOADX: begin
            tULAControler = uADD;
            tXControler = rLOAD;
            tYControler = rHOLD;
            tZControler = rHOLD;
        end
        ADD: begin
            tULAControler = uADD;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rLOAD;
        end
        SUB: begin
            tULAControler = uSUB;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rLOAD;
        end
        MULT: begin
            tULAControler = uMULT;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rLOAD;
        end
        DIV: begin
            tULAControler = uDIV;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rLOAD;
        end
        MIN: begin
            tULAControler = uMENOR;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rLOAD;
        end
        MAX: begin
            tULAControler = uMAIOR;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rLOAD;
        end
        DISP: begin
            tULAControler = uADD;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rHOLD;
        end
        END: begin
            tULAControler = uADD;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rHOLD;
        end
        default: begin
            tULAControler = uADD;
            tXControler = rHOLD;
            tYControler = rHOLD;
            tZControler = rHOLD;
        end
    endcase
end

endmodule