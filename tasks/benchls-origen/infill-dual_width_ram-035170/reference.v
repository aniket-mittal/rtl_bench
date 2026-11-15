module origen_035170 #(
    parameter WIDTHA = 384,
    parameter SIZEA = 128,
    parameter ADDRWIDTHA = 7,
    parameter WIDTHB = 48,
    parameter SIZEB = 1024,
    parameter ADDRWIDTHB = 10
) (
    input wire clkA,
    input wire clkB,
    input wire weA,
    input wire [ADDRWIDTHA-1:0] addrA,
    input wire [ADDRWIDTHB-1:0] addrB,
    input wire [WIDTHA-1:0] dinA,
    output reg [WIDTHB-1:0] doutB
);

    localparam maxWIDTH = (WIDTHA > WIDTHB) ? WIDTHA : WIDTHB;
    localparam minWIDTH = (WIDTHA < WIDTHB) ? WIDTHA : WIDTHB;
    localparam maxSIZE = (SIZEA > SIZEB) ? SIZEA : SIZEB;
    localparam RATIO = maxWIDTH / minWIDTH;

    reg [minWIDTH-1:0] RAM [0:maxSIZE-1];
    reg [WIDTHB-1:0] readB;

    function integer log2;
        input integer value;
        integer temp;
        begin
            temp = value - 1;
            for (log2 = 0; temp > 0; log2 = log2 + 1)
                temp = temp >> 1;
        end
    endfunction

    localparam LSBADDR = log2(RATIO);

    always @(posedge clkB) begin
        readB <= RAM[addrB];
    end

    integer i;
    always @(posedge clkA) begin
        if (weA) begin
            for (i = 0; i < RATIO; i = i + 1) begin
                RAM[{addrA, i[LSBADDR-1:0]}] <= dinA[minWIDTH*i +: minWIDTH];
            end
        end
    end

    always @(posedge clkB) begin
        doutB <= readB;
    end

endmodule