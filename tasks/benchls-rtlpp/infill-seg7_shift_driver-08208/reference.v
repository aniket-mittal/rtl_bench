module rtlpp_08208
(
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

    // Combine seg and sel into a single 16-bit data bus
    wire [13:0] data; // Adjust to 14 bits to match bit concatenation
    assign data = {seg[7:0], sel[5:0]};

    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 2'b0;
            cnt_bit <= 4'b0;
            ds <= 1'b0;
            shcp <= 1'b0;
            stcp <= 1'b0;
        end else begin
            cnt <= cnt + 2'b01;

            if (cnt == 2'b11) begin
                if (cnt_bit == 4'b1101)
                    cnt_bit <= 4'b0000;
                else
                    cnt_bit <= cnt_bit + 4'b0001;
            end else begin
                cnt_bit <= cnt_bit;
            end

            if (cnt == 2'b00)
                ds <= data[cnt_bit];
            else
                ds <= ds;

            if (cnt == 2'b10)
                shcp <= 1'b1;
            else if (cnt == 2'b00)
                shcp <= 1'b0;
            else
                shcp <= shcp;

            if (cnt == 2'b00 && cnt_bit == 4'b0000)
                stcp <= 1'b1;
            else if (cnt == 2'b10 && cnt_bit == 4'b0000)
                stcp <= 1'b0;
            else
                stcp <= stcp;
        end
    end

    assign oe = 1'b0;

endmodule