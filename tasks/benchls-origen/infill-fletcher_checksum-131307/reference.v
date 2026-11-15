module origen_131307 (
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire [15:0] len,
    output reg [15:0] checksum
);

reg [31:0] sum1, sum2;
reg [15:0] counter;
reg [7:0] data_buffer;
reg odd_byte;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        sum1 <= 32'h0;
        sum2 <= 32'h0;
        counter <= 16'h0;
        checksum <= 16'h0;
        odd_byte <= 1'b0;
        data_buffer <= 8'h0;
    end else begin
        if (counter < len) begin
            if (odd_byte) begin
                sum1 <= sum1 + {data_buffer, data_in};
                sum2 <= sum2 + sum1;
                odd_byte <= 1'b0;
                counter <= counter + 2;
            end else begin
                data_buffer <= data_in;
                odd_byte <= 1'b1;
                counter <= counter + 1;
            end
        end else if (counter == len && odd_byte) begin
            sum1 <= sum1 + {data_buffer, 8'h0};
            sum2 <= sum2 + sum1;
            counter <= counter + 1;
        end else if (counter == len + 1) begin
            checksum <= ~{sum2[15:0] + sum2[31:16], sum1[15:0] + sum1[31:16]};
        end
    end
end

endmodule

module fletcher_checksum_checker (
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire [15:0] len,
    input wire [15:0] checksum,
    output reg valid
);

reg [31:0] sum1, sum2;
reg [15:0] counter;
reg [7:0] data_buffer;
reg odd_byte;
reg [15:0] computed_checksum;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        sum1 <= 32'h0;
        sum2 <= 32'h0;
        counter <= 16'h0;
        odd_byte <= 1'b0;
        data_buffer <= 8'h0;
        computed_checksum <= 16'h0;
        valid <= 1'b0;
    end else begin
        if (counter < len) begin
            if (odd_byte) begin
                sum1 <= sum1 + {data_buffer, data_in};
                sum2 <= sum2 + sum1;
                odd_byte <= 1'b0;
                counter <= counter + 2;
            end else begin
                data_buffer <= data_in;
                odd_byte <= 1'b1;
                counter <= counter + 1;
            end
        end else if (counter == len && odd_byte) begin
            sum1 <= sum1 + {data_buffer, 8'h0};
            sum2 <= sum2 + sum1;
            counter <= counter + 1;
        end else if (counter == len + 1) begin
            computed_checksum <= ~{sum2[15:0] + sum2[31:16], sum1[15:0] + sum1[31:16]};
            valid <= (computed_checksum == checksum);
        end
    end
end

endmodule