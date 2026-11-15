module origen_187879(
    input [31:0] in,
    output reg [31:0] out
);

always @(in) begin
    if (in == 32'b0) begin
        out = 32;
    end
    else if (in[31:1] == 31'b0) begin
        out = 31;
    end
    else if (in[31:2] == 30'b0) begin
        out = 30;
    end
    else if (in[31:3] == 29'b0) begin
        out = 29;
    end
    else if (in[31:4] == 28'b0) begin
        out = 28;
    end
    else if (in[31:5] == 27'b0) begin
        out = 27;
    end
    else if (in[31:6] == 26'b0) begin
        out = 26;
    end
    else if (in[31:7] == 25'b0) begin
        out = 25;
    end
    else if (in[31:8] == 24'b0) begin
        out = 24;
    end
    else if (in[31:9] == 23'b0) begin
        out = 23;
    end
    else if (in[31:10] == 22'b0) begin
        out = 22;
    end
    else if (in[31:11] == 21'b0) begin
        out = 21;
    end
    else if (in[31:12] == 20'b0) begin
        out = 20;
    end
    else if (in[31:13] == 19'b0) begin
        out = 19;
    end
    else if (in[31:14] == 18'b0) begin
        out = 18;
    end
    else if (in[31:15] == 17'b0) begin
        out = 17;
    end
    else if (in[31:16] == 16'b0) begin
        out = 16;
    end
    else if (in[31:17] == 15'b0) begin
        out = 15;
    end
    else if (in[31:18] == 14'b0) begin
        out = 14;
    end
    else if (in[31:19] == 13'b0) begin
        out = 13;
    end
    else if (in[31:20] == 12'b0) begin
        out = 12;
    end
    else if (in[31:21] == 11'b0) begin
        out = 11;
    end
    else if (in[31:22] == 10'b0) begin
        out = 10;
    end
    else if (in[31:23] == 9'b0) begin
        out = 9;
    end
    else if (in[31:24] == 8'b0) begin
        out = 8;
    end
    else if (in[31:25] == 7'b0) begin
        out = 7;
    end
    else if (in[31:26] == 6'b0) begin
        out = 6;
    end
    else if (in[31:27] == 5'b0) begin
        out = 5;
    end
    else if (in[31:28] == 4'b0) begin
        out = 4;
    end
    else if (in[31:29] == 3'b0) begin
        out = 3;
    end
    else if (in[31:30] == 2'b0) begin
        out = 2;
    end
    else if (in[31] == 1'b0) begin
        out = 1;
    end
    else begin
        out = 0;
    end
end

endmodule