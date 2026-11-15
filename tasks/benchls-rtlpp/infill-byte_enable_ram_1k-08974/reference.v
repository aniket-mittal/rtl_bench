module rtlpp_08974 (
    address,
    byteenable,
    chipselect,
    clk,
    clken,
    write,
    writedata,
    readdata
);

    output [31:0] readdata;
    input [9:0] address;
    input [3:0] byteenable;
    input chipselect;
    input clk;
    input clken;
    input write;
    input [31:0] writedata;

    reg [31:0] ram [0:1023];
    reg [31:0] readdata;
    wire wren;
    integer i;

    assign wren = chipselect & write;

    always @(posedge clk) begin
        if (clken) begin
            if (wren) begin
                for (i = 0; i < 4; i = i + 1) begin
                    if (byteenable[i]) begin
                        ram[address][8*i +: 8] <= writedata[8*i +: 8];
                    end
                end
            end
            readdata <= ram[address];
        end
    end

endmodule