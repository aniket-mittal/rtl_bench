module origen_132592 (
    input wire aclr,
    input wire [15:0] data,
    input wire rdclk,
    input wire rdreq,
    input wire wrclk,
    input wire wrreq,
    output wire [31:0] q,
    output wire [7:0] rdusedw
);

    reg [15:0] fifo [255:0];
    reg [7:0] write_ptr, read_ptr;
    reg [7:0] count;

    always @(posedge wrclk or posedge aclr) begin
        if (aclr) begin
            write_ptr <= 8'd0;
        end else if (wrreq) begin
            fifo[write_ptr] <= data;
            write_ptr <= write_ptr + 1;
        end
    end

    reg [31:0] read_data;
    reg read_toggle;

    always @(posedge rdclk or posedge aclr) begin
        if (aclr) begin
            read_ptr <= 8'd0;
            read_toggle <= 1'b0;
            read_data <= 32'd0;
        end else if (rdreq) begin
            if (read_toggle) begin
                read_data[31:16] <= fifo[read_ptr];
                read_ptr <= read_ptr + 1;
            end else begin
                read_data[15:0] <= fifo[read_ptr];
            end
            read_toggle <= ~read_toggle;
        end
    end

    assign q = read_data;

    always @(posedge wrclk or posedge aclr) begin
        if (aclr) begin
            count <= 8'd0;
        end else if (wrreq && !rdreq) begin
            count <= count + 1;
        end else if (!wrreq && rdreq && count != 0) begin
            count <= count - 1;
        end
    end

    assign rdusedw = count;

endmodule