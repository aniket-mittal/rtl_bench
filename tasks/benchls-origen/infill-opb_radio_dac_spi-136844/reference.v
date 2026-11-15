module origen_136844 (
    input wire OPB_Clk,
    input wire rst,
    input wire [31:0] opb_abus,
    input wire [3:0] opb_be,
    input wire [31:0] opb_dbus,
    input wire opb_rnw,
    input wire opb_select,
    input wire opb_seqaddr,

    output reg [31:0] sl_dbus,
    output reg sl_errack,
    output reg sl_retry,
    output reg sl_toutsup,
    output reg sl_xferack,

    output wire radio1_sclk,
    output wire radio1_dout,
    output wire radio1_cs,
    output wire radio2_sclk,
    output wire radio2_dout,
    output wire radio2_cs,
    output wire radio3_sclk,
    output wire radio3_dout,
    output wire radio3_cs,
    output wire radio4_sclk,
    output wire radio4_dout,
    output wire radio4_cs,

    output wire dac1_sclk,
    output wire dac1_dout,
    output wire dac1_cs,
    output wire dac2_sclk,
    output wire dac2_dout,
    output wire dac2_cs,
    output wire dac3_sclk,
    output wire dac3_dout,
    output wire dac3_cs,
    output wire dac4_sclk,
    output wire dac4_dout,
    output wire dac4_cs
);

    // Internal signals
    wire [31:0] wb_adr_i;
    wire [31:0] wb_dat_i;
    reg [31:0] wb_dat_o;
    wire [3:0] wb_sel_i;
    wire wb_we_i;
    wire wb_cyc_i;
    wire wb_stb_i;
    reg wb_ack_o;

    // OPB to Wishbone bridge logic
    assign wb_adr_i = opb_abus;
    assign wb_dat_i = opb_dbus;
    assign wb_sel_i = opb_be;
    assign wb_we_i = ~opb_rnw;
    assign wb_cyc_i = opb_select;
    assign wb_stb_i = opb_select;

    always @(posedge OPB_Clk or posedge rst) begin
        if (rst) begin
            sl_dbus <= 32'b0;
            sl_errack <= 1'b0;
            sl_retry <= 1'b0;
            sl_toutsup <= 1'b0;
            sl_xferack <= 1'b0;
        end else begin
            sl_dbus <= wb_dat_o;
            sl_errack <= 1'b0;
            sl_retry <= 1'b0;
            sl_toutsup <= 1'b0;
            sl_xferack <= wb_ack_o;
        end
    end

    // SPI controller logic
    reg [3:0] spi_cs;
    reg spi_sclk;
    reg spi_dout;

    always @(posedge OPB_Clk or posedge rst) begin
        if (rst) begin
            spi_cs <= 4'b1111;
            spi_sclk <= 1'b0;
            spi_dout <= 1'b0;
            wb_dat_o <= 32'b0;
            wb_ack_o <= 1'b0;
        end else if (wb_cyc_i && wb_stb_i) begin
            case (wb_adr_i[7:0])
                8'h00: begin
                    if (wb_we_i) begin
                        spi_cs <= wb_dat_i[3:0];
                    end else begin
                        wb_dat_o <= {28'b0, spi_cs};
                    end
                    wb_ack_o <= 1'b1;
                end
                8'h04: begin
                    if (wb_we_i) begin
                        spi_sclk <= wb_dat_i[0];
                        spi_dout <= wb_dat_i[1];
                    end else begin
                        wb_dat_o <= {30'b0, spi_dout, spi_sclk};
                    end
                    wb_ack_o <= 1'b1;
                end
                default: begin
                    wb_dat_o <= 32'b0;
                    wb_ack_o <= 1'b1;
                end
            endcase
        end else begin
            wb_ack_o <= 1'b0;
        end
    end

    // Assign SPI signals to output ports
    assign {radio1_cs, radio2_cs, radio3_cs, radio4_cs} = spi_cs;
    assign {dac1_cs, dac2_cs, dac3_cs, dac4_cs} = spi_cs;

    assign radio1_sclk = spi_sclk;
    assign radio2_sclk = spi_sclk;
    assign radio3_sclk = spi_sclk;
    assign radio4_sclk = spi_sclk;
    assign dac1_sclk = spi_sclk;
    assign dac2_sclk = spi_sclk;
    assign dac3_sclk = spi_sclk;
    assign dac4_sclk = spi_sclk;

    assign radio1_dout = spi_dout;
    assign radio2_dout = spi_dout;
    assign radio3_dout = spi_dout;
    assign radio4_dout = spi_dout;
    assign dac1_dout = spi_dout;
    assign dac2_dout = spi_dout;
    assign dac3_dout = spi_dout;
    assign dac4_dout = spi_dout;

endmodule