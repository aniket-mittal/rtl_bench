module origen_136054 (
    input wire clk,
    input wire rst,
    input wire [15:0] data_in,
    output reg [4:0] count_out
);

    reg [15:0] data_reg1, data_reg2, data_reg3;
    reg [4:0] count_reg1, count_reg2, count_reg3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_reg1 <= 16'b0;
            data_reg2 <= 16'b0;
            data_reg3 <= 16'b0;
            count_reg1 <= 5'b0;
            count_reg2 <= 5'b0;
            count_reg3 <= 5'b0;
            count_out <= 5'b0;
        end else begin
            // Stage 1: Count zeros in the first 8 bits
            data_reg1 <= data_in;
            count_reg1 <= (data_in[7:0] == 8'b0) ? 8 :
                          (data_in[6:0] == 7'b0) ? 7 :
                          (data_in[5:0] == 6'b0) ? 6 :
                          (data_in[4:0] == 5'b0) ? 5 :
                          (data_in[3:0] == 4'b0) ? 4 :
                          (data_in[2:0] == 3'b0) ? 3 :
                          (data_in[1:0] == 2'b0) ? 2 :
                          (data_in[0] == 1'b0) ? 1 : 0;

            // Stage 2: Count zeros in the second 8 bits
            data_reg2 <= data_reg1;
            count_reg2 <= count_reg1;
            if (count_reg1 == 8) begin
                count_reg2 <= count_reg1 + ((data_reg1[15:8] == 8'b0) ? 8 :
                                            (data_reg1[15:9] == 7'b0) ? 7 :
                                            (data_reg1[15:10] == 6'b0) ? 6 :
                                            (data_reg1[15:11] == 5'b0) ? 5 :
                                            (data_reg1[15:12] == 4'b0) ? 4 :
                                            (data_reg1[15:13] == 3'b0) ? 3 :
                                            (data_reg1[15:14] == 2'b0) ? 2 :
                                            (data_reg1[15] == 1'b0) ? 1 : 0);
            end

            // Stage 3: Output the final count
            data_reg3 <= data_reg2;
            count_reg3 <= count_reg2;
            count_out <= count_reg3;
        end
    end

endmodule