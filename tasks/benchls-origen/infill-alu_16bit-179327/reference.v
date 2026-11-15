module origen_179327(
    input  wire [15:0] A,
    input  wire [15:0] B,
    input  wire [3:0]  ICNT,
    output wire [15:0] OUT
);

`define ISADD 4'b0000
`define ISSUB 4'b0001
`define ISAND 4'b0010
`define ISOR  4'b0011

reg [15:0] a, b, r;
reg        cin;

always @(*) begin
    case (ICNT)
        `ISADD: begin
            a = A;
            b = B;
            cin = 1'b0;
        end
        `ISSUB: begin
            a = A;
            b = ~B;
            cin = 1'b1;
        end
        `ISAND: begin
            a = A;
            b = B;
            cin = 1'b0;
            r = a & b;
        end
        `ISOR: begin
            a = A;
            b = B;
            cin = 1'b0;
            r = a | b;
        end
        default: begin
            a = 16'b0;
            b = 16'b0;
            cin = 1'b0;
        end
    endcase

    if (ICNT == `ISADD || ICNT == `ISSUB) begin
        r = a + b + cin;
    end
end

assign OUT = r;

endmodule