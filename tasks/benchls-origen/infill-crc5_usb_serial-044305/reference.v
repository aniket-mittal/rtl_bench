module origen_044305 (
    input wire clk,
    input wire rst,
    input wire data_in,
    input wire put,
    output reg data_out
);

    reg [10:0] temp;
    reg [4:0] crc_temp, crc_out;
    reg [3:0] count;
    reg trigger;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            temp <= 11'b0;
            crc_temp <= 5'b0;
            crc_out <= 5'b0;
            count <= 4'b0;
            trigger <= 1'b0;
            data_out <= 1'b0;
        end else begin
            if (put) begin
                trigger <= 1'b1;
            end

            if (trigger) begin
                if (count < 4'd11) begin
                    temp <= {temp[9:0], data_in};
                    count <= count + 1'b1;
                end else if (count < 4'd15) begin
                    crc_temp[4] <= temp[10] ^ crc_temp[3];
                    crc_temp[3] <= crc_temp[2];
                    crc_temp[2] <= temp[10] ^ crc_temp[1];
                    crc_temp[1] <= crc_temp[0];
                    crc_temp[0] <= temp[10];
                    temp <= {temp[9:0], 1'b0};
                    count <= count + 1'b1;
                end else begin
                    crc_out <= crc_temp;
                    count <= 4'd0;
                    trigger <= 1'b0;
                end
            end

            if (|crc_out) begin
                data_out <= crc_out[4];
                crc_out <= {crc_out[3:0], 1'b0};
            end
        end
    end

endmodule