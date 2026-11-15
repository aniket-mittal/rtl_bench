module origen_190341(
    input clk,
    input reset,
    input [3:0] readaddress1,
    input [3:0] readaddress2,
    input [3:0] writeaddress1,
    input [3:0] writeaddress2,
    input [15:0] writedata1,
    input [15:0] writedata2,
    input enable1,
    input enable2,
    output [15:0] readdata1,
    output [15:0] readdata2,
    output [3:0] reg15address
);

    reg [15:0] registers [0:15];

    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            registers[0]  <= 16'h0000;
            registers[1]  <= 16'h0F00;
            registers[2]  <= 16'h0050;
            registers[3]  <= 16'hFF0F;
            registers[4]  <= 16'hF0FF;
            registers[5]  <= 16'h0040;
            registers[6]  <= 16'h6666;
            registers[7]  <= 16'h00FF;
            registers[8]  <= 16'hFF77;
            registers[9]  <= 16'h0000;
            registers[10] <= 16'h0000;
            registers[11] <= 16'h0000;
            registers[12] <= 16'hCC89;
            registers[13] <= 16'h0002;
            registers[14] <= 16'h0000;
            registers[15] <= 16'h0000;
        end
        else begin
            if (enable1) begin
                registers[writeaddress1] <= writedata1;
            end
            if (enable2) begin
                registers[writeaddress2] <= writedata2;
            end
        end
    end

    assign readdata1 = registers[readaddress1];
    assign readdata2 = registers[readaddress2];
    assign reg15address = 4'd15;

endmodule