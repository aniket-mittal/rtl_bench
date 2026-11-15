module origen_084456 #(
    parameter INIVAL = 0,
    parameter BW = 8
) (
    input wire clk,
    input wire rst_n,
    input wire data_in,
    input wire pol,
    input wire refclk,
    input wire [BW-1:0] flt_rise_st,
    input wire [BW-1:0] flt_fall_st,
    output reg data_out,
    output reg act_edge,
    output reg inact_edge
);

reg [BW-1:0] flt_count;
wire flt_count_full;
wire [BW-1:0] flt_threshold;

assign flt_threshold = data_in ? flt_rise_st : flt_fall_st;
assign flt_count_full = (flt_count == {BW{1'b1}});

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_out <= INIVAL;
        flt_count <= {BW{1'b0}};
        act_edge <= 1'b0;
        inact_edge <= 1'b0;
    end else if (refclk) begin
        if (data_in != data_out) begin
            if (flt_count_full) begin
                data_out <= data_in;
                flt_count <= ~flt_threshold;
                act_edge <= data_in ^ ~pol;
                inact_edge <= ~data_in ^ ~pol;
            end else begin
                flt_count <= flt_count + 1'b1;
                act_edge <= 1'b0;
                inact_edge <= 1'b0;
            end
        end else begin
            flt_count <= ~flt_threshold;
            act_edge <= 1'b0;
            inact_edge <= 1'b0;
        end
    end else begin
        act_edge <= 1'b0;
        inact_edge <= 1'b0;
    end
end

endmodule