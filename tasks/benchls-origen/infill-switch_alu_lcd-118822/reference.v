module origen_118822(
    input [7:0] SWI,
    output reg [7:0] LED,
    output [7:0] SEG,
    output lcd_e, lcd_rs, lcd_rw,
    output [3:0] lcd_dat
);

    wire [1:0] A, B, result;
    wire [2:0] op;
    reg [1:0] temp_result;
    reg carry;

    assign A = SWI[1:0];
    assign B = SWI[3:2];
    assign op = SWI[6:4];

    // Custom functions
    function [1:0] subF;
        input [1:0] a, b;
        reg c;
        begin
            {c, subF} = a - b;
        end
    endfunction

    function [1:0] orNotF;
        input [1:0] a, b;
        begin
            orNotF = a | ~b;
        end
    endfunction

    function [1:0] andNotF;
        input [1:0] a, b;
        begin
            andNotF = a & ~b;
        end
    endfunction

    function [1:0] addF;
        input [1:0] a, b;
        reg c;
        begin
            {c, addF} = a + b;
        end
    endfunction

    function [1:0] andF;
        input [1:0] a, b;
        begin
            andF = a & b;
        end
    endfunction

    function [1:0] orF;
        input [1:0] a, b;
        begin
            orF = a | b;
        end
    endfunction

    // ALU operation
    always @(*) begin
        case(op)
            3'b000: temp_result = andF(A, B);
            3'b001: temp_result = orF(A, B);
            3'b010: temp_result = addF(A, B);
            3'b100: temp_result = andNotF(A, B);
            3'b101: temp_result = orNotF(A, B);
            3'b110: temp_result = subF(A, B);
            3'b111: {carry, temp_result} = A - B;
            default: temp_result = 2'b00;
        endcase
    end

    assign result = temp_result;

    // Assign ALU result to LED output
    always @(*) begin
        LED[1:0] = result;
        LED[7:2] = 6'b000000;
    end

    // LCD debug outputs
    reg [7:0] lcd_registrador [0:31];
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            lcd_registrador[i] = i + 1;
        end
    end

    wire [63:0] lcd_a = {56'hABCDEF0123456, SWI};
    wire [63:0] lcd_b = {SWI, 56'h789ABCDEF01234};

    // Assign dummy values to unused outputs
    assign SEG = 8'h00;
    assign lcd_e = 1'b0;
    assign lcd_rs = 1'b0;
    assign lcd_rw = 1'b0;
    assign lcd_dat = 4'h0;

endmodule