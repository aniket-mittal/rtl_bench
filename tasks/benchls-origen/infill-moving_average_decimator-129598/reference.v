module origen_129598 #(
    parameter N = 4,
    parameter WIDTH = 24
) (
    input wire clk,
    input wire rst,
    input wire bypass,
    input wire run,
    input wire [7:0] cpi,
    input wire stb_in,
    input wire signed [WIDTH-1:0] data_in,
    output reg stb_out,
    output reg signed [WIDTH-1:0] data_out,
    output reg [$clog2(N)-1:0] count_out
);

    reg [$clog2(N)-1:0] sample_count;
    reg [WIDTH-1:0] sum;
    reg [7:0] clock_count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stb_out <= 0;
            data_out <= 0;
            sample_count <= 0;
            sum <= 0;
            clock_count <= 0;
            count_out <= 0;
        end else if (run) begin
            if (stb_in && clock_count == 0) begin
                if (bypass) begin
                    data_out <= data_in;
                    stb_out <= 1;
                end else begin
                    sum <= sum + data_in;
                    sample_count <= sample_count + 1;
                    count_out <= count_out + 1;

                    if (sample_count == N - 1) begin
                        data_out <= sum / N;
                        stb_out <= 1;
                        sum <= 0;
                        sample_count <= 0;
                    end else begin
                        stb_out <= 0;
                    end
                end
            end else begin
                stb_out <= 0;
            end

            if (clock_count == cpi - 1) begin
                clock_count <= 0;
            end else begin
                clock_count <= clock_count + 1;
            end
        end
    end
endmodule

