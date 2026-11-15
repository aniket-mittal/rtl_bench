module origen_020739 (
    input wire CLK,
    input wire RSTn,
    input wire start_sig,
    input wire nxt_pix_sig,
    input wire [9:0] cols,
    output reg pix_done_sig,
    output reg [9:0] column_addr_sig,
    output reg [9:0] row_addr_sig
);

reg [17:0] imk;
reg [9:0] column_addr, row_addr;
reg isCtrlDone;
reg start_sig_d, start_sig_rising;

always @(posedge CLK or negedge RSTn) begin
    if (!RSTn) begin
        start_sig_d <= 1'b0;
    end else begin
        start_sig_d <= start_sig;
    end
end

always @(*) begin
    start_sig_rising = start_sig & ~start_sig_d;
end

always @(posedge CLK or negedge RSTn) begin
    if (!RSTn) begin
        imk <= 18'd1;
        column_addr <= 10'd1;
        row_addr <= 10'd1;
        isCtrlDone <= 1'b1;
    end else if (start_sig_rising) begin
        imk <= 18'd1;
        column_addr <= 10'd1;
        row_addr <= 10'd1;
        isCtrlDone <= 1'b1;
    end else if (nxt_pix_sig) begin
        imk <= imk + 18'd1;
        row_addr <= (imk / {8'd0, cols}) + 10'd1;
        column_addr <= (imk % {8'd0, cols}) + 10'd1;
        isCtrlDone <= 1'b1;
    end else begin
        isCtrlDone <= 1'b0;
    end
end

always @(*) begin
    pix_done_sig = isCtrlDone;
    column_addr_sig = column_addr;
    row_addr_sig = row_addr;
end

endmodule