module origen_162662 #(
    parameter ADDRSIZE = 4
)(
    output reg [ADDRSIZE-1:0] raddr,
    output reg [ADDRSIZE-1:0] rptr,
    output reg rempty,
    input [ADDRSIZE-1:0] rwptr2,
    input rinc,
    input rclk,
    input rrst
);

    reg [ADDRSIZE-1:0] rbin;
    reg [ADDRSIZE-1:0] rgnext, rbnext;

    always @(posedge rclk or posedge rrst) begin
        if (rrst) begin
            rbin <= 0;
            rptr <= 0;
        end
        else begin
            rbin <= rbnext;
            rptr <= rgnext;
        end
    end

    always @* begin
        if (rrst) begin
            rbnext = 0;
            rgnext = 0;
        end
        else if (!rempty && rinc) begin
            rbnext = rbin + 1'b1;
            rgnext = {rbnext[ADDRSIZE-2:0], rbnext[ADDRSIZE-1] ^ rbnext[ADDRSIZE-2]};
        end
        else begin
            rbnext = rbin;
            rgnext = rbin;
        end
    end

    always @(posedge rclk or posedge rrst) begin
        if (rrst) begin
            rempty <= 1'b1;
        end
        else begin
            rempty <= (rgnext == rwptr2);
        end
    end

    always @* begin
        raddr = rbin[ADDRSIZE-1:0];
    end

endmodule