module origen_199691 (
    input S_AXIS_ACLK,
    input S_AXIS_ARESETN,
    input S_AXIS_TVALID,
    input [31:0] S_AXIS_TDATA,
    input S_AXIS_TLAST,
    output reg S_AXIS_TREADY,
    input sck,
    input ws,
    output reg sd
);

reg [31:0] data_left;
reg [31:0] data_right;
reg [31:0] data;
reg wsp;

always @(posedge S_AXIS_ACLK) begin
    if (~S_AXIS_ARESETN) begin
        data_left <= 0;
        data_right <= 0;
        data <= 0;
        wsp <= 0;
        S_AXIS_TREADY <= 0;
        sd <= 0;
    end
    else begin
        wsp <= ws;
        if (S_AXIS_TVALID && S_AXIS_TREADY) begin
            if (S_AXIS_TLAST) begin
                data_left <= S_AXIS_TDATA;
            end
            else begin
                data_right <= S_AXIS_TDATA;
            end
        end
        if (~wsp && ws) begin
            data <= (wsp) ? data_left : data_right;
            S_AXIS_TREADY <= 1;
        end
        else begin
            S_AXIS_TREADY <= 0;
        end
        if (~sck && wsp) begin
            data <= {data[30:0], 1'b0};
            sd <= data[31];
        end
    end
end

endmodule