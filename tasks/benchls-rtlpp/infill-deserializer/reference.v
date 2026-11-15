module Deserializer (
    input         clk,
    input         reset,
    input  [15:0] datain,
    output [15:0] dataout0,
    output [15:0] dataout1,
    output [15:0] dataout2,
    output [15:0] dataout3,
    output [15:0] dataout4,
    output [15:0] dataout5,
    output [15:0] dataout6,
    output [15:0] dataout7,
    output [15:0] dataout8,
    output [15:0] dataout9,
    output [15:0] dataout10,
    output [15:0] dataout11,
    output [15:0] dataout12,
    output [15:0] dataout13,
    output [15:0] dataout14,
    output [15:0] dataout15,
    output [15:0] dataout16,
    output [15:0] dataout17,
    output [15:0] dataout18,
    output [15:0] dataout19,
    output [15:0] dataout20,
    output [15:0] dataout21,
    output [15:0] dataout22,
    output [15:0] dataout23,
    output [15:0] dataout24,
    output [15:0] dataout25,
    output [15:0] dataout26,
    output [15:0] dataout27,
    output [15:0] dataout28,
    output [15:0] dataout29,
    output [15:0] dataout30,
    output [15:0] dataout31,
    output        finish
);
    reg [15:0] data[0:31];
    reg [5:0]  cnt;
    reg        fin;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cnt <= 6'd0;
            fin <= 0;
        end else if (cnt < 32) begin
            data[cnt] <= datain;
            cnt <= cnt + 1;
        end else begin
            fin <= 1;
        end
    end

    assign dataout0 = data[0];
    assign dataout1 = data[1];
    assign dataout2 = data[2];
    assign dataout3 = data[3];
    assign dataout4 = data[4];
    assign dataout5 = data[5];
    assign dataout6 = data[6];
    assign dataout7 = data[7];
    assign dataout8 = data[8];
    assign dataout9 = data[9];
    assign dataout10 = data[10];
    assign dataout11 = data[11];
    assign dataout12 = data[12];
    assign dataout13 = data[13];
    assign dataout14 = data[14];
    assign dataout15 = data[15];
    assign dataout16 = data[16];
    assign dataout17 = data[17];
    assign dataout18 = data[18];
    assign dataout19 = data[19];
    assign dataout20 = data[20];
    assign dataout21 = data[21];
    assign dataout22 = data[22];
    assign dataout23 = data[23];
    assign dataout24 = data[24];
    assign dataout25 = data[25];
    assign dataout26 = data[26];
    assign dataout27 = data[27];
    assign dataout28 = data[28];
    assign dataout29 = data[29];
    assign dataout30 = data[30];
    assign dataout31 = data[31];
    assign finish    = fin;
endmodule