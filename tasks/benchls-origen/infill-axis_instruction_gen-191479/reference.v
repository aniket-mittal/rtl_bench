module origen_191479 (
    input  wire           clk,
    input  wire           rst,
    input  wire [127:0]   instruction,
    input  wire           instrc_valid,
    output wire           axis_ready,
    output wire [31:0]    axis_data,
    output wire           axis_valid,
    output wire           axis_last,
    output wire           generate_done
);

    reg [2:0]  data_num;
    reg [3:0]  segment_num;
    reg        tvalid;

    wire next_data = axis_ready & tvalid;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_num <= 0;
            segment_num <= 0;
            tvalid <= 0;
        end else if (generate_done) begin
            data_num <= 0;
            segment_num <= 0;
            tvalid <= 0;
        end else if (next_data) begin
            if (data_num == 3'd7) begin
                data_num <= 0;
                segment_num <= segment_num + 1;
            end else begin
                data_num <= data_num + 1;
            end
            tvalid <= 1;
        end else begin
            tvalid <= 0;
        end
    end

    assign axis_data = (data_num == 3'd0) ? instruction[31:0] :
                      (data_num == 3'd1) ? instruction[63:32] :
                      (data_num == 3'd2) ? instruction[95:64] :
                      (data_num == 3'd3) ? instruction[127:96] :
                      (data_num == 3'd4) ? 32'h0000_1000 :
                      (data_num == 3'd5) ? 32'h0000_0100 :
                      (data_num == 3'd6) ? 32'h0000_0010 :
                      (data_num == 3'd7) ? 32'h0000_0001 :
                      32'h0000_0000;

    assign axis_valid = tvalid & ~generate_done;
    assign axis_last = (data_num == 3'd7);
    assign generate_done = (segment_num == 4'b1111);
    assign axis_ready = 1'b1;

endmodule