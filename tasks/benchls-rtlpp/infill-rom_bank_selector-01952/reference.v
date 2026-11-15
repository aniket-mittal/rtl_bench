module rtlpp_01952(
    input [7:0] dip,
    input reset_b,
    input adr15,
    input adr14,
    input adr13,
    input ioreq_b,
    input mreq_b,
    input romen_b,
    input wr_b,
    input rd_b,
    input [7:0] data,
    input clk,
    input busrq_b,
    input busack_b,
    output romdis,
    output rom01cs_b,
    output rom23cs_b,
    output rom45cs_b,
    output romoe_b,
    output roma14
);

    reg [7:0] romsel_q;
    reg [5:0] rom16k_cs_r;

    assign rom01cs_b = !(rom16k_cs_r[0] | rom16k_cs_r[1]);
    assign rom23cs_b = !(rom16k_cs_r[2] | rom16k_cs_r[3]);
    assign rom45cs_b = !(rom16k_cs_r[4] | rom16k_cs_r[5]);
    assign roma14 = rom16k_cs_r[1] | rom16k_cs_r[3] | rom16k_cs_r[5];

    assign romoe_b = romen_b;
    assign romdis = |rom16k_cs_r;

    wire wclk = !(!ioreq_b && !wr_b && !adr13 && adr15 && adr14);

    always @(negedge reset_b or posedge wclk)
        if (!reset_b)
            romsel_q <= 8'b0;
        else
            romsel_q <= data;

    always @(*) begin
        rom16k_cs_r = 6'b0;
        if (!adr14)
            rom16k_cs_r[0] = dip[0] & (dip[7] == 1'b0);
        else if (dip[7:6] == 2'b00) begin
            rom16k_cs_r[0] = 1'b0;
            rom16k_cs_r[1] = dip[1] & (romsel_q == 8'h0);
            rom16k_cs_r[2] = dip[2] & (romsel_q == 8'h1);
            rom16k_cs_r[3] = dip[3] & (romsel_q == 8'h2);
            rom16k_cs_r[4] = dip[4] & (romsel_q == 8'h3);
            rom16k_cs_r[5] = dip[5] & (romsel_q == 8'h4);
        end
        else if (dip[7:6] == 2'b01) begin
            rom16k_cs_r[0] = 1'b0;
            rom16k_cs_r[1] = dip[1] & (romsel_q == 8'h0);
            rom16k_cs_r[2] = dip[2] & (romsel_q == 8'hA);
            rom16k_cs_r[3] = dip[3] & (romsel_q == 8'hB);
            rom16k_cs_r[4] = dip[4] & (romsel_q == 8'hC);
            rom16k_cs_r[5] = dip[5] & (romsel_q == 8'hD);
        end
        else if (dip[7:6] == 2'b10) begin
            rom16k_cs_r[0] = dip[0] & (romsel_q == 8'h1);
            rom16k_cs_r[1] = dip[1] & (romsel_q == 8'h2);
            rom16k_cs_r[2] = dip[2] & (romsel_q == 8'h3);
            rom16k_cs_r[3] = dip[3] & (romsel_q == 8'h4);
            rom16k_cs_r[4] = dip[4] & (romsel_q == 8'h5);
            rom16k_cs_r[5] = dip[5] & (romsel_q == 8'h6);
        end
        else if (dip[7:6] == 2'b11) begin
            rom16k_cs_r[0] = dip[0] & (romsel_q == 8'h8);
            rom16k_cs_r[1] = dip[1] & (romsel_q == 8'h9);
            rom16k_cs_r[2] = dip[2] & (romsel_q == 8'hA);
            rom16k_cs_r[3] = dip[3] & (romsel_q == 8'hB);
            rom16k_cs_r[4] = dip[4] & (romsel_q == 8'hC);
            rom16k_cs_r[5] = dip[5] & (romsel_q == 8'hD);
        end
    end

endmodule