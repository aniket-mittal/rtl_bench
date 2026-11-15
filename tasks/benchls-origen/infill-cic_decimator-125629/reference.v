module origen_125629 #(
    parameter WIDTH = 16,
    parameter N_STAGES = 4,
    parameter RMAX = 32,
    parameter RATE_WIDTH = $clog2(RMAX)
) (
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] input_tdata,
    input wire input_tvalid,
    output wire input_tready,
    output wire [WIDTH-1:0] output_tdata,
    output wire output_tvalid,
    input wire output_tready,
    input wire [RATE_WIDTH-1:0] rate
);

localparam MAX_GROWTH = WIDTH + N_STAGES * $clog2(RMAX);

reg [MAX_GROWTH-1:0] integrator_stages [N_STAGES-1:0];
reg [MAX_GROWTH-1:0] comb_stages [N_STAGES-1:0];
reg [MAX_GROWTH-1:0] comb_delays [N_STAGES-1:0];

reg [$clog2(RMAX)-1:0] sample_count;
reg output_valid;
wire decimate_now;

assign decimate_now = (sample_count == rate - 1);
assign input_tready = output_tready | ~output_valid;
assign output_tvalid = output_valid;
assign output_tdata = comb_stages[N_STAGES-1][MAX_GROWTH-1 -: WIDTH];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        sample_count <= 0;
        output_valid <= 0;
    end else begin
        if (input_tvalid & input_tready) begin
            if (decimate_now) begin
                sample_count <= 0;
                output_valid <= 1;
            end else begin
                sample_count <= sample_count + 1;
            end
        end

        if (output_valid & output_tready) begin
            output_valid <= 0;
        end
    end
end

genvar i;
generate
    // Integrator stages
    for (i = 0; i < N_STAGES; i = i + 1) begin : integrator_gen
        if (i == 0) begin
            always @(posedge clk or posedge rst) begin
                if (rst) begin
                    integrator_stages[i] <= 0;
                end else if (input_tvalid & input_tready) begin
                    integrator_stages[i] <= integrator_stages[i] + {{(MAX_GROWTH-WIDTH){input_tdata[WIDTH-1]}}, input_tdata};
                end
            end
        end else begin
            always @(posedge clk or posedge rst) begin
                if (rst) begin
                    integrator_stages[i] <= 0;
                end else if (input_tvalid & input_tready) begin
                    integrator_stages[i] <= integrator_stages[i] + integrator_stages[i-1];
                end
            end
        end
    end

    // Comb stages
    for (i = 0; i < N_STAGES; i = i + 1) begin : comb_gen
        if (i == 0) begin
            always @(posedge clk or posedge rst) begin
                if (rst) begin
                    comb_stages[i] <= 0;
                    comb_delays[i] <= 0;
                end else if (decimate_now & input_tvalid & input_tready) begin
                    comb_stages[i] <= integrator_stages[N_STAGES-1] - comb_delays[i];
                    comb_delays[i] <= integrator_stages[N_STAGES-1];
                end
            end
        end else begin
            always @(posedge clk or posedge rst) begin
                if (rst) begin
                    comb_stages[i] <= 0;
                    comb_delays[i] <= 0;
                end else if (decimate_now & input_tvalid & input_tready) begin
                    comb_stages[i] <= comb_stages[i-1] - comb_delays[i];
                    comb_delays[i] <= comb_stages[i-1];
                end
            end
        end
    end
endgenerate

endmodule