module rtlpp_02765(
    reset,
    clk0,
    refresh_count,
    bur_len,
    ref_ack,
    ref_req
);

// Assuming burst_size is defined in "parameter.v", and its value should be replaced here.
localparam burst_size = 3; // Replace with the actual value used in parameter.v.

input reset;
input clk0;
input [15:0] refresh_count;
input [burst_size - 1 : 0] bur_len;
input ref_ack;

output reg ref_req;

reg [15:0] refresh_timer;
reg rftimer_zero;

always @(posedge reset or posedge clk0) begin
    if (reset == 1'b1) begin
        refresh_timer <= 16'h0000;
        rftimer_zero  <= 1'b0;
        ref_req       <= 1'b0;
    end else begin
        if (rftimer_zero == 1'b1) begin
            refresh_timer <= refresh_count;
        end else if (bur_len != 3'b000) begin
            refresh_timer <= refresh_timer - 1'b1;
        end
        
        if ((refresh_timer == 0) & (bur_len != 3'b000)) begin
            rftimer_zero <= 1'b1;
            ref_req <= 1'b1;
        end else if (ref_ack == 1'b1) begin
            rftimer_zero <= 1'b0;
            ref_req <= 1'b0;
        end
    end
end

endmodule