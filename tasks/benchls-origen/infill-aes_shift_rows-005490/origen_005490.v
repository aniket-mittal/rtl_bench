module origen_005490 #(
    parameter DATA_WIDTH = 128
) (
    input wire shiftRow_valid_in,
    input wire [DATA_WIDTH-1:0] shiftRow_data_in,
    output reg [DATA_WIDTH-1:0] shiftRow_data_out,
    output reg shiftRow_valid_out
);

    [MASKED]

    always @(*) begin
        shiftRow_valid_out = shiftRow_valid_in;
    end

endmodule

// Testbench
module tb_ShiftRow;
    reg [127:0] shiftRow_data_in;
    wire [127:0] shiftRow_data_out;
    
    reg clk;
    integer i;
    reg [127:0] testvectors[0:10];
    
    ShiftRow uut (
        .shiftRow_valid_in(1'b1),
        .shiftRow_data_in(shiftRow_data_in),
        .shiftRow_data_out(shiftRow_data_out)
    );
    
    initial begin
        $readmemh("shiftRowTest.tv", testvectors);
        clk = 0;
        for (i = 0; i < 11; i = i + 1) begin
            @(posedge clk);
            shiftRow_data_in = testvectors[i];
        end
        #100 ;
    end
    
    always #50 clk = ~clk;
    
endmodule