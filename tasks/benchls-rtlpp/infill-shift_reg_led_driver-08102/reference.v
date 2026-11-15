module rtlpp_08102 (
    input clk,
    input rst_n,
    input [7:0] seg,
    input [5:0] sel,
    output reg shcp,
    output reg stcp,
    output reg ds,
    output oe
);

    reg [1:0] cnt;
    reg [3:0] cnt_bit;
    
    wire [13:0] data;

    assign data = {seg[7:0], sel[5:0]};

    always @ (posedge clk) begin
        if (!rst_n) begin
            cnt <= 2'b00;
            cnt_bit <= 4'b0000;
            ds <= 1'b0;
            shcp <= 1'b0;
            stcp <= 1'b0;
        end else begin
            cnt <= cnt + 2'b01;

            if (cnt == 2'b11) begin
                if (cnt_bit == 4'hD)
                    cnt_bit <= 4'b0000;
                else
                    cnt_bit <= cnt_bit + 4'b0001;
            end

            if (cnt == 2'b00)
                ds <= data[cnt_bit];
            
            if (cnt == 2'b10)
                shcp <= 1'b1;
            else if (cnt == 2'b00)
                shcp <= 1'b0;
            
            if (cnt == 2'b00 && cnt_bit == 4'h0)
                stcp <= 1'b1;
            else if (cnt == 2'b10 && cnt_bit == 4'h0)
                stcp <= 1'b0;
        end
    end

    assign oe = 1'b0;

endmodule