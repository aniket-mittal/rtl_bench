module origen_186972(
    input clk,
    input rst_n,
    input idexregwrite,
    input idexmemtoreg,
    input idexbranch,
    input idexmemwrite,
    input [31:0] addout,
    input [31:0] aluresult,
    input [4:0] idrd,
    input zero,
    input [31:0] exr2_dout,
    input flush,
    output reg exmemregwrite,
    output reg exmemmemtoreg,
    output reg exmembranch,
    output reg exmemmemwrite,
    output reg [31:0] memaddr,
    output reg [31:0] memdata,
    output reg [4:0] memrd
);

    initial begin
        exmemregwrite = 1'b0;
        exmemmemtoreg = 1'b0;
        exmembranch = 1'b0;
        exmemmemwrite = 1'b0;
        memaddr = 32'b0;
        memdata = 32'b0;
        memrd = 5'b0;
    end

    always @(posedge clk) begin
        if (!rst_n || flush) begin
            exmemregwrite = 1'b0;
            exmemmemtoreg = 1'b0;
            exmembranch = 1'b0;
            exmemmemwrite = 1'b0;
            memaddr = 32'b0;
            memdata = 32'b0;
            memrd = 5'b0;
        end else begin
            exmemregwrite = idexregwrite;
            exmemmemtoreg = idexmemtoreg;
            exmembranch = idexbranch;
            exmemmemwrite = idexmemwrite;
            memaddr = addout;
            memdata = exr2_dout;
            memrd = idrd;
        end
    end

endmodule