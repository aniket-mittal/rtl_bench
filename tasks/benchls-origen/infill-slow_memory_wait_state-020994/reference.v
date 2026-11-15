module origen_020994 (
    input wire clk,
    input wire rst,
    input wire read,
    input wire write,
    input wire [6:0] address,
    input wire [15:0] write_data,
    output reg [15:0] read_data,
    output reg busy_wait
);

    reg [15:0] memory [0:127];
    reg [6:0] counter;
    reg operation_in_progress;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            integer i;
            for (i = 0; i < 128; i = i + 1) begin
                memory[i] <= 16'b0;
            end
            read_data <= 16'b0;
            busy_wait <= 1'b0;
            counter <= 7'b0;
            operation_in_progress <= 1'b0;
        end else begin
            if (!operation_in_progress && read && !write) begin
                operation_in_progress <= 1'b1;
                busy_wait <= 1'b1;
                counter <= 7'b0;
            end else if (!operation_in_progress && write && !read) begin
                operation_in_progress <= 1'b1;
                busy_wait <= 1'b1;
                counter <= 7'b0;
            end else if (operation_in_progress) begin
                if (counter == 7'd97) begin
                    if (read) begin
                        read_data <= memory[address];
                    end else if (write) begin
                        memory[address] <= write_data;
                    end
                    operation_in_progress <= 1'b0;
                    busy_wait <= 1'b0;
                    counter <= 7'b0;
                end else begin
                    counter <= counter + 1'b1;
                end
            end
        end
    end

endmodule