module rtlpp_01382 (
    input rst_i,
    input clk_i,
    input cyc_i,
    input stb_i,
    output ack_o,
    input we_i,
    input [127:0] dat_i,
    input cs_i,
    input sclk,
    input cts,
    output [3:0] txd,
    output reg empty
);
    reg txing;
    reg [135:0] tx_data;
    reg [127:0] fdo;
    reg [8:0] cnt;
    reg rd;

    assign ack_o = cyc_i & stb_i & cs_i;
    assign txd = tx_data[3:0];

    // Edge Detector Logic
    reg pe_ack_d1, ack_o_d1;

    always @(posedge sclk or posedge rst_i) begin
        if (rst_i) begin
            pe_ack_d1 <= 1'b0;
            ack_o_d1 <= 1'b0;
        end 
        else begin
            ack_o_d1 <= ack_o & we_i;
            pe_ack_d1 <= ack_o_d1 & ~(ack_o & we_i);
        end
    end
    
    wire pe_ack = pe_ack_d1;

    always @(posedge sclk or posedge rst_i)
        if (rst_i) begin
            txing <= 1'b0;
            empty <= 1'b1;
            cnt <= 9'h00;
            rd <= 1'b0;
            tx_data <= {136{1'b1}};
        end
        else begin
            if (pe_ack)
                fdo <= dat_i;
            if (pe_ack)
                empty <= 1'b0;
            else if (rd)
                empty <= 1'b1;

            rd <= 1'b0;

            cnt <= cnt + 9'd1;
            if (cnt == 9'h87)
                txing <= 1'b0;

            if (cnt == 9'h87 || !txing) begin
                cnt <= 9'd0;
                if (!empty && cts) begin
                    txing <= 1'b1;
                    tx_data <= {4'hF,fdo,4'h0};
                    rd <= 1'b1;
                end
            end

            else if (cnt[1:0] == 2'h3)
                tx_data <= {4'hF,tx_data[135:4]};
        end

endmodule