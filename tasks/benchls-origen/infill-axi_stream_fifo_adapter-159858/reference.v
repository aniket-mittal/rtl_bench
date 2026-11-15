module origen_159858 #(
    parameter DATAWIDTH = 64,
    parameter MAX_READY_LATENCY = 8
) (
    input clk,
    input rst,
    input sop,
    input eop,
    input [DATAWIDTH-1:0] data,
    input dval,
    input axi_rdy,
    output rdy,
    output [DATAWIDTH-1:0] axi_data,
    output axi_valid,
    output axi_last
);

reg [DATAWIDTH-1:0] data_queue [MAX_READY_LATENCY-1:0];
reg [clog2(MAX_READY_LATENCY)-1:0] queue_head, queue_tail;
reg eop_d;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        queue_head <= 0;
        queue_tail <= 0;
        eop_d <= 0;
    end else begin
        if (dval) begin
            data_queue[queue_tail] <= data;
            queue_tail <= queue_tail + 1;
        end
        if (axi_rdy && axi_valid) begin
            queue_head <= queue_head + 1;
            eop_d <= eop;
        end
    end
end

assign rdy = axi_rdy;
assign axi_valid = dval | (queue_head != queue_tail);
assign axi_data = (queue_head == queue_tail) ? data : data_queue[queue_head];
assign axi_last = (queue_head == queue_tail) & (eop ^ eop_d);

function integer clog2;
    input integer value;
    begin
        value = value - 1;
        for (clog2 = 0; value > 0; clog2 = clog2 + 1)
            value = value >> 1;
    end
endfunction

endmodule