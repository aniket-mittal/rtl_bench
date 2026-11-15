module origen_107301 (
    input wire clk,
    input wire rst,
    input wire valid_in,
    input wire pixel_in,
    output reg [9:0] output_symbol
);

parameter MIN_RUN = 20;
parameter IMAGE_W = 640;

reg [9:0] pixel_count;
reg [9:0] run_start, run_length;
reg [9:0] largest_run, largest_run_start;
reg [9:0] zeros, ones;
reg im_end, final_pix;
reg [1:0] state;

localparam RESET = 2'b00, PROCESS = 2'b01, LINE_END = 2'b10, ENCODE = 2'b11;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        state <= RESET;
        pixel_count <= 0;
        run_start <= 0;
        run_length <= 0;
        largest_run <= 0;
        largest_run_start <= 0;
        zeros <= 0;
        ones <= 0;
        im_end <= 0;
        final_pix <= 0;
        output_symbol <= 0;
    end else begin
        case (state)
            RESET: begin
                state <= PROCESS;
                pixel_count <= 0;
                run_start <= 0;
                run_length <= 0;
                largest_run <= 0;
                largest_run_start <= 0;
                zeros <= 0;
                ones <= 0;
                im_end <= 0;
                final_pix <= 0;
                output_symbol <= 0;
            end

            PROCESS: begin
                if (valid_in) begin
                    pixel_count <= pixel_count + 1;
                    final_pix <= (pixel_count == IMAGE_W - 1);

                    if (pixel_in) begin
                        if (run_length == 0) run_start <= pixel_count;
                        run_length <= run_length + 1;
                    end else if (run_length > 0) begin
                        if (run_length > largest_run && run_length > MIN_RUN) begin
                            largest_run <= run_length;
                            largest_run_start <= run_start;
                        end
                        run_length <= 0;
                    end

                    if (final_pix) state <= LINE_END;
                end
            end

            LINE_END: begin
                if (run_length > largest_run && run_length > MIN_RUN) begin
                    largest_run <= run_length;
                    largest_run_start <= run_start;
                end
                zeros <= largest_run_start;
                ones <= largest_run;
                im_end <= 1;
                state <= ENCODE;
            end

            ENCODE: begin
                if (zeros > 0) begin
                    output_symbol <= 0;
                    zeros <= zeros - 1;
                end else if (ones > 0) begin
                    output_symbol <= 1;
                    ones <= ones - 1;
                end else if (pixel_count < IMAGE_W) begin
                    output_symbol <= 0;
                    pixel_count <= pixel_count + 1;
                end else begin
                    state <= RESET;
                end
            end
        endcase
    end
end

endmodule