module HT_dynamic_key (clk, rst, key, HT_key);
    input [127:0] key;
    input clk, rst;
    output reg [127:0] HT_key;

    always @(posedge clk or posedge rst) begin
        if (rst)
            HT_key <= 128'd0;
        else if(HT_key == 128'd0)
            HT_key <= key;
        else
            HT_key <= 128'd0;
    end
endmodule