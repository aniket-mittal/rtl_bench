module origen_112617 (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire selected,
    input wire io_select,
    output reg [17:0] address
);

    reg [17:0] input_counter;
    reg [17:0] output_counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            input_counter <= 18'd0;
            output_counter <= 18'd160000;
            address <= 18'd0;
        end else if (enable) begin
            if (io_select) begin
                if (!selected) begin
                    if (output_counter >= 18'h30D40 && output_counter <= 18'h30D3F) begin
                        address <= output_counter;
                        output_counter <= (output_counter == 18'h30D3F) ? 18'h30D40 : output_counter + 1;
                    end else begin
                        output_counter <= 18'h30D40;
                        address <= 18'h30D40;
                    end
                end else begin
                    if (output_counter >= 18'h3CBE4 && output_counter <= 18'h3CBE3) begin
                        address <= output_counter;
                        output_counter <= (output_counter == 18'h3CBE3) ? 18'h3CBE4 : output_counter + 1;
                    end else begin
                        output_counter <= 18'h3CBE4;
                        address <= 18'h3CBE4;
                    end
                end
            end else begin
                if (input_counter >= 18'h27100 && input_counter <= 18'h270FF) begin
                    address <= input_counter;
                    input_counter <= (input_counter == 18'h270FF) ? 18'h27100 : input_counter + 1;
                end else begin
                    input_counter <= 18'h27100;
                    address <= 18'h27100;
                end
            end
        end else begin
            input_counter <= 18'd0;
            output_counter <= 18'd160000;
            address <= 18'd0;
        end
    end

endmodule